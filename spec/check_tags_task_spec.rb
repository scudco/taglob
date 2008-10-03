require 'spec/spec_helper'
require 'taglob/rake'

describe Taglob::Rake::CheckTagsTask do
  
  before :all do
    @file_name ="./lib/taglob/rake/check_tags_task.rb"
    @rake = Rake::Application.new
    Rake.application = @rake
  end
  
  after :all do
    Rake.application = nil 
  end
  
  it "should define a rake task depending on provided name" do
    task = Taglob::Rake::CheckTagsTask.new :foozor
    @rake.task_names_include?("foozor").should be_true
  end
  it "should raise error if invalid tags present" 
  it "should not raise error if only valid tags present"
end