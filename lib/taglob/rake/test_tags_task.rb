require 'rake'
require 'rake/testtask'
module Taglob
  module Rake
    class TestTagsTask
      attr_accessor :pattern
      attr_accessor :tags

      def initialize(name = :test_tags)
        @name = name
        yield self if block_given?
        define
      end

      def define
        ::Rake::TestTask.new @name do |t|
          t.test_files = test_files
        end
      end

      def test_files
        Dir.taglob(pattern,tags)
      end
    end
  end
end
