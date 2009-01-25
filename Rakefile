$:.unshift(File.join(File.dirname(__FILE__), 'lib'))

require 'taglob'
require 'rubygems'
require 'hoe'
require 'spec/rake/spectask'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |s|
    s.name = "taglob"
    s.summary = "Dir.taglob selects tagged Ruby files"
    s.email = "adamandersonis@gmail.com"
    s.homepage = "http://scudco.github.com/taglob"
    s.description = "Tagging for Ruby files"
    s.authors = ["Adam Anderson"]
    s.files =  FileList["[A-Z]*", "{bin,generators,lib,spec}/**/*"]
    s.executables = ['taglob']
    s.extra_rdoc_files = ["History.txt", "Manifest.txt", "README.txt"]
    s.has_rdoc = true
    s.rdoc_options = ["--main", "README.txt"]
  end
rescue LoadError
  puts "Jeweler not available. Install it with: sudo gem install technicalpickles-jeweler -s http://gems.github.com"
end

desc "Run all examples"
Spec::Rake::SpecTask.new('spec') do |t|
  t.spec_files = FileList['spec/*.rb']
end

desc "Run all examples with RCov"
Spec::Rake::SpecTask.new('rcov') do |t|
  t.spec_files = FileList['spec/**/*_spec.rb']
  t.libs << File.join(File.dirname(__FILE__), 'lib')
  t.rcov = true
  t.rcov_dir = 'artifacts'
  t.rcov_opts = ['--exclude', 'spec']
end
