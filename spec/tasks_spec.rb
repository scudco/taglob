require 'rubygems'
require 'taglob/rake'
require 'spec/spec_helper'

describe "Taza Tasks" do

  before :all do
    @file_name ="./lib/taglob/rake/test_task.rb"
    @rake = Rake::Application.new
    Rake.application = @rake
  end

  after :all do
    Rake.application = nil
  end

  it "should create a rake task to run test unit tests marked with tags" do
    Dir.stubs(:taglob).returns(['spec/tagged_files/foo.rb'])
    task = Taglob::Rake::TestTagsTask.new :applePie
    @rake.task_names_include?("applePie").should be_true
  end

  it "should create a rake task to run specs marked with tags" do
    load @file_name
    @rake.task_names_include?("spec_tag").should be_true
  end

  it "should be able to run tags grouped as a OR" do
    task = Taglob::Rake::TestTagsTask.new :or_test do |t|
      t.pattern = 'spec/tagged_files/*.rb'
      t.tags = "bar|lulz"
    end
    tagged_files = task.test_files
    tagged_files.should_not include('spec/tagged_files/foo.rb')
    tagged_files.should include('spec/tagged_files/foo_bar_buttz.rb')
    tagged_files.should include('spec/tagged_files/epic_lulz.rb')
  end

  it "should be able to run tags grouped as a AND" do
    task = Taglob::Rake::TestTagsTask.new :and_test do |t|
      t.pattern = 'spec/tagged_files/*.rb'
      t.tags = "foo,bar"
    end
    tagged_files = task.test_files
    tagged_files.should_not include('spec/tagged_files/foo.rb')
    tagged_files.should include('spec/tagged_files/foo_bar_buttz.rb')
    tagged_files.should_not include('spec/tagged_files/epic_lulz.rb')
  end
end
