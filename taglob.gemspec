require 'rake'

Gem::Specification.new do |s|
  s.author = "Adam Anderson"
  s.email = "adamandersonis@gmail.com"
  s.version = '0.0.1'  
  s.rubyforge_project = "taglob"
  s.homepage = "http://github.com/scudco/taglob/tree"
  s.has_rdoc = true
  s.summary = "Tagging for Ruby files"
  s.name = 'taglob'
  s.require_path = 'lib'
  s.files = FileList['lib/**/*','spec/**/*','README','History.txt']
  s.description = <<EOF
Taglob allows the tagging of Ruby files through special comment lines.
It creates the Dir.taglob method which takes a pattern and any number of tags. \
It then returns files tagged with the specified tags. 
EOF
end