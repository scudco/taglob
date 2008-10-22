require 'rake'
require 'rake/testtask'
require 'spec/rake/spectask'
require 'taglob'

module Taglob
  module Rake
    # TagsTask will allow you to specify your own TestTagTasks in your Rakefile:
    #
    # Example : Using Unit Test Framework
    #      require 'taglob/rake'
    #      Taglob::Rake::SpecTagsTask.new :spec_regression do |t|
    #        t.pattern = 'spec/**/*_spec.rb'
    #        t.tags = "regression|smoke"
    #      end
    #
    # Example : Using RSpec Test Framework
    #      require 'taglob/rake'
    #      Taglob::Rake::TestTagsTask.new :test_regression do |t|
    #        t.pattern = 'test/**/test_*.rb'
    #        t.tags = "regression|smoke"
    #      end
    class TagsTask
      attr_accessor :pattern
      attr_accessor :tags

      def initialize(name)
        @name = name
        yield self if block_given?
        define
      end

      def test_files
        Dir.taglob(pattern,tags) unless tags.nil? || pattern.nil?
      end
    end

    # TestTagsTask : To run rake tasks on unit test framework
    #                Require 'taglob/rake/tasks' in your Rakefile to get test_tag.
    # Example :
    #
    #      * $ rake test_tag tags="for,the,win"  #Contain all of these tags (AND condition)
    #      * $ rake test_tag tags="foo|bar"      #Contain any of these tags (OR condition)
    #
    class TestTagsTask < TagsTask
      def initialize(name = :test_tags)
        super(name)
      end

      def define
        ::Rake::TestTask.new @name do |t|
          t.test_files = test_files
        end
      end      
    end

    # SpecTagsTask : To run rake tasks on Rspec test framework
    #               require 'taglob/rake/tasks' in your Rakefile to get spec_tag.
    #
    # Example :
    #      * $ rake spec_tag tags="for,the,win"  #Contain all of these tags (AND condition)
    #      * $ rake spec_tag tags="foo|bar"      #Contain any of these tags (OR condition)
    #
    class SpecTagsTask < TagsTask
      def initialize(name = :spec_tags)
        super(name)
      end

      def define
        ::Spec::Rake::SpecTask.new @name do |t|
          t.spec_files = test_files
        end
      end
    end

  end
end
