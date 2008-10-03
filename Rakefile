$:.unshift(File.join(File.dirname(__FILE__), 'lib'))

require 'taglob'
require 'rubygems'
require 'hoe'
require 'spec/rake/spectask'

Hoe.new('Taglob', Taglob::VERSION) do |p|
  p.name = "taglob"
  p.author = "Adam Anderson"
  p.description = "Tagging for Ruby files"
  p.email = 'adamandersonis@gmail.com'
  p.summary = "Dir.taglob selects tagged Ruby files"
  p.url = "http://taglob.rubyforge.org"
  p.remote_rdoc_dir = '' # Release to root
end

desc "Run all examples"
Spec::Rake::SpecTask.new('spec') do |t|
  t.spec_files = FileList['spec/*.rb']
end
