require 'rubygems'
require 'lib/taglob'
require 'spec/rake/spectask'


#Rake::TestTask.new :test_tag do |t|
#  t.test_files = Dir.taglob('test/**/test_*.rb',ENV['tags'])
#end
Spec::Rake::SpecTask.new :spec_tag do |t|
#  t.spec_files = Dir.taglob('spec/**/*_spec.rb', ENV['tags'])
end