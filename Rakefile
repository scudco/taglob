require './lib/taglob.rb'
require 'rubygems'
require 'rake/gempackagetask'

require 'spec/rake/spectask'

desc "Run all examples"
Spec::Rake::SpecTask.new('spec') do |t|
  t.spec_files = FileList['spec/*.rb']
end

spec = Gem::Specification.new do |s|
  s.author = "Adam Anderson"
  s.email = "adamandersonis@gmail.com"
  s.rubyforge_project = "taglob"
  s.has_rdoc = true
  s.homepage = "http://github.com/scudco/taglob/tree"
  s.platform = Gem::Platform::RUBY
  s.summary = "Tagging for Ruby files"
  s.name = 'taglob'
  s.version = Taglob::VERSION
  s.requirements << 'none'
  s.require_path = 'lib'
  s.files = FileList['lib/**/*','spec/**/*','README','History.txt']
  s.description = <<EOF
Taglob allows the tagging of Ruby files through special comment lines.
It creates the Dir.taglob method which takes a pattern and any number of tags. \
It then returns files tagged with the specified tags. 
EOF
end

Rake::GemPackageTask.new(spec) do |pkg|
  pkg.need_zip = true
  pkg.need_tar = true
end