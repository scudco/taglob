require 'spec/runner/formatter/html_formatter'

module Taglob
  module Spec
    class HtmlFormatter < ::Spec::Runner::Formatter::HtmlFormatter

      def report_header
        if ENV['tags'].nil? || ENV['tags'].empty?
          super
        else
          super + "<div id=\"tags\">Executed with tags: #{ENV['tags']}</div>"
        end
      end

    end
  end
end
