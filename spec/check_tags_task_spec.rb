require 'spec/spec_helper'
require 'taglob/rake'

describe Taglob::Rake::CheckTagsTask do
  
  before :each do
    @file_name ="./lib/taglob/rake/check_tags_task.rb"
    @rake = Rake::Application.new
    Rake.application = @rake
  end
  
  after :each do
    Rake.application = nil 
  end
  
  it "should define a rake task depending on provided name" do
    task = Taglob::Rake::CheckTagsTask.new :foozor
    @rake.task_names_include?("foozor").should be_true
  end
  
  it "should be able to define rake task value in constructor do block" do
    pattern = "spec/**/*_spec.rb"
    task = Taglob::Rake::CheckTagsTask.new do |t|
      t.pattern = pattern
    end
    task.pattern.should eql(pattern)
  end
  
  it "should build valid tag list from provided file" do
    task = Taglob::Rake::CheckTagsTask.new do |t|
      t.valid_tag_source = 'spec/invalid_tags.txt'
    end
    task.valid_tag_list.should eql(['foo'])
  end
  
  it "should raise error if invalid tags present" do
    task = Taglob::Rake::CheckTagsTask.new :error_out do |t|
      t.pattern = 'spec/tagged_files/*.rb'
      t.valid_tag_source = 'spec/invalid_tags.txt'
    end
    lambda {@rake.invoke_task('error_out')}.should raise_error(SystemExit)
  end
  
  it "should not raise error if only valid tags present" do
    task = Taglob::Rake::CheckTagsTask.new :no_errors do |t|
      t.pattern = 'spec/tagged_files/*.rb'
      t.valid_tag_source = 'spec/valid_tags.txt'
    end
    lambda {@rake.invoke_task('no_errors')}.should_not raise_error(SystemExit)
  end
end