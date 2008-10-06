module Taglob
  module Rake
    class TestTagsTask
      attr_accessor :pattern
      attr_accessor :tags
      
      def initialize(name = :check_tags)
        @name = name
        yield self if block_given?
      end
      
      def test_files
        Dir.taglob(pattern,tags)
      end
    end
  end
end