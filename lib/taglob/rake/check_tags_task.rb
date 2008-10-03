require 'rake'
require 'rake/tasklib'

module Taglob
  module Rake
    class CheckTagsTask < ::Rake::TaskLib
      
      attr_accessor :pattern
      def initialize(name = :check_tags)
        @name = name
        yield self if block_given?
        define
      end
      
      def define
        task @name do
        end
      end
    end
  end
end