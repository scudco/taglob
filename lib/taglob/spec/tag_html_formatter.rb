# To display tag information while running the specs
# USAGE : Set the tags first if using in command line
# $ export tags=foo then run spec with following options
#["--require rubygems,taglob/spec/tag_html_formatter --format TagHtmlFormatter:#{file_name}"]  
# Example: 
# $ spec --require rubygems,taglob/spec/tag_html_formatter --format TagHtmlFormatter:#{file_name}.html

require 'spec/runner/formatter/html_formatter'

class Spec::Runner::Formatter::HtmlFormatter    
  alias :original_report_header :report_header
  alias :original_global_styles :global_styles
  def report_header
    if ENV['tags'].nil?
      original_report_header
    else
      original_report_header + "<div id='tag-header'><h3>These specs contain the following tags: #{ENV['tags']}</h3></div>"          
    end        
  end 
  
  def global_styles        
    original_global_styles + ".rspec-report h3 {margin: 0px 10px 0px 10px; padding: 10px;font: normal 11px ,'Lucida Grande', Helvetica, sans-serif;font-size: 1.2em;}"        
  end
end
