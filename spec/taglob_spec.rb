require 'lib/taglob'

describe "Taglob#parse_tags" do 
  
  #taglob formatted line is as follows:
  #tags: foo,bar,lulz,epic
  
  it "should parse tags from taglob formatted line(#tags: foo,bar,buttz)" do 
    tags = Dir.parse_tags("#tags: foo,bar,buttz")
    tags.should be_a_kind_of(Array)
    tags.should_not be_empty
    tags.should have(3).items
    tags.should include('foo')
    tags.should include('bar')
    tags.should include('buttz')
  end
  
  it "should return an empty array for a taglob formatted line with no tags" do
    tags = Dir.parse_tags("#tags: ")
    tags.should be_a_kind_of(Array)
    tags.should be_empty
  end
  
  it "should return an empty array for an incorrectly formatted line" do
    tags = Dir.parse_tags("#tags ")
    tags.should be_a_kind_of(Array)
    tags.should be_empty
    tags = Dir.parse_tags("tags: foo,bar,buttz")
    tags.should be_a_kind_of(Array)
    tags.should be_empty
    tags = Dir.parse_tags("   #tags: lololo")
    tags.should be_a_kind_of(Array)
    tags.should be_empty
  end
  
end

describe "Taglob#taglob" do 
    
  it "should select files tagged with specified tags" do 
    tagged_files = Dir.taglob('spec/tagged_files/*.rb','foo','bar','buttz')
    tagged_files.should be_a_kind_of(Array)
    tagged_files.should_not be_empty
    tagged_files.should have(2).items
    tagged_files.should include('spec/tagged_files/foo.rb')
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