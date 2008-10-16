require 'rake'
require 'rake/tasklib'
require 'taglob'

module Taglob
  module Rake
# CheckTagsTask will check all tags in a glob pattern against a valid list of tags
#
# Example :
#      require 'taglob/rake'
#      task = Taglob::Rake::CheckTagsTask.new do |t|
#        t.pattern = 'spec/**/*_spec.rb'
#        t.valid_tag_source = 'config/valid_tags.txt'
#      end
#
    class CheckTagsTask < ::Rake::TaskLib
      attr_accessor :pattern
      attr_accessor :valid_tag_source
      
      def initialize(name = :check_tags)
        @name = name
        yield self if block_given?
        define
      end
      
      def define
        task @name do
          invalid_tags = Taglob.invalid_tags(pattern,valid_tag_list)
          invalid_tags.each {|file,tags| $stderr.puts "Invalid tags: #{tags.join(',')} found in #{file}." }
          exit 1 if !invalid_tags.empty?
        end
      end
      
      def valid_tag_list
        var = File.readlines(valid_tag_source).collect {|line| line.chomp }
      end
      
    end
  end
end
