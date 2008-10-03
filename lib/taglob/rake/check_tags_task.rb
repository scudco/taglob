require 'rake'
require 'rake/tasklib'

module Taglob
  module Rake
    class CheckTagsTask < ::Rake::TaskLib
      def initialize(name = :check_tags)
        @name = name
        define
      end
      
      def define
        task @name do
        end
      end
    end
  end
end