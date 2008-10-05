require 'taglob'
require 'spec/spec_helper'

describe Taglob do
  it "should provide invalid tags" do
    invalid_tags = Taglob.invalid_tags('spec/tagged_files/*.rb',['foo'])
    invalid_tags.size.should > 0
    invalid_tags.each {|file,tags| tags.should_not include('foo')}
  end
end

describe "Taglob#parse_tags" do 
  
  #taglob formatted line is as follows:
  #tags: foo,bar,lulz,epic
  # tags: foo,bar,lulz
  #tags: foo   ,    bar   , lulz
  
  it "should parse tags from taglob formatted line(#tags: foo,bar,buttz)" do 
    tags = File.parse_tags("#tags: foo,bar,buttz")
    tags.should be_a_kind_of(Array)
    tags.should_not be_empty
    tags.should have(3).items
    tags.should include('foo')
    tags.should include('bar')
    tags.should include('buttz')
  end
  
  it "should return an empty array for a taglob formatted line with no tags" do
    tags = File.parse_tags("#tags: ")
    tags.should be_a_kind_of(Array)
    tags.should be_empty
  end
  
  it "should return an empty array for an incorrectly formatted line" do
    tags = File.parse_tags("#tags ")
    tags.should be_a_kind_of(Array)
    tags.should be_empty
    tags = File.parse_tags("tags: foo,bar,buttz")
    tags.should be_a_kind_of(Array)
    tags.should be_empty
    tags = File.parse_tags("   #tags: lololo")
    tags.should be_a_kind_of(Array)
    tags.should be_empty
  end
  
  it "should allow '#tags: ...' or '# tags: ' only" do
    tags = File.parse_tags("#tags: lol,rofl")
    tags_with_space = File.parse_tags("# tags: lol,rofl")
    tags.should == tags_with_space
  end
  
  it "should ignore leading and trailing spaces in tags" do
    tags = File.parse_tags("#tags: foo   ,    bar   , buttz")
    tags.should be_a_kind_of(Array)
    tags.should_not be_empty
    tags.should have(3).items
    tags.should include('foo')
    tags.should include('bar')
    tags.should include('buttz')
  end

  it "should contain foo at first element" do
    tags = File.tags('spec/tagged_files/foo.rb')
    tags.first.should eql('foo')
  end
  
end

describe "Taglob#taglob" do 
  
  it "should select files containing a superset or the same set of the specified tags" do 
    tagged_files = Dir.taglob('spec/tagged_files/*.rb','foo','bar','buttz')
    tagged_files.should be_a_kind_of(Array)
    tagged_files.should_not be_empty
    tagged_files.should have(1).items
    tagged_files.should_not include('spec/tagged_files/foo.rb')
    tagged_files.should include('spec/tagged_files/foo_bar_buttz.rb')
  end
  
  it "should not select files that are not tagged with specified tags" do
    tagged_files = Dir.taglob('spec/tagged_files/*.rb','lol','rofl')
    tagged_files.should be_a_kind_of(Array)
    tagged_files.should be_empty
  end
  
  it "should not care where the taglob line is in the file" do
    tagged_files = Dir.taglob('spec/tagged_files/*.rb','buttz')
    tagged_files.should be_a_kind_of(Array)
    tagged_files.should_not be_empty
    tagged_files.should have(1).items
    tagged_files.should include('spec/tagged_files/foo_bar_buttz.rb')
  end
  
  it "should count every taglob line" do
    tagged_files = Dir.taglob('spec/tagged_files/*.rb','epic','lulz')
    tagged_files.should be_a_kind_of(Array)
    tagged_files.should_not be_empty
    tagged_files.should have(1).items
    tagged_files.should include('spec/tagged_files/epic_lulz.rb')
  end
end