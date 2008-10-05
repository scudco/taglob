require 'rubygems'
require 'lib/tasks'

describe "Taza Tasks" do
  
  before :all do
    @file_name ="./lib/tasks.rb"
    @rake = Rake::Application.new
    Rake.application = @rake
  end
  
  after :all do
    Rake.application = nil 
  end
  
  it "should create a rake task to run test unit tests marked with tags" do
    load @file_name 
    tasks.include?("test_tag").should be_true
  end
  
  it "should create a rake task to run specs marked with tags" do
    load @file_name 
    tasks.include?("spec_tag").should be_true
  end
  
  def tasks
    @rake.tasks.collect{|task| task.name }
  end
end