Gem::Specification.new do |s|
  s.name = %q{taglob}
  s.version = "0.1.0"

  s.specification_version = 2 if s.respond_to? :specification_version=

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Adam Anderson"]
  s.date = %q{2008-05-19}
  s.description = %q{Tagging for Ruby files}
  s.email = %q{adamandersonis@gmail.com}
  s.extra_rdoc_files = ["History.txt", "Manifest.txt", "README.txt"]
  s.files = ["History.txt", "Manifest.txt", "README.txt", "Rakefile", "lib/taglob.rb", "spec/spec_taglob.rb", "spec/tagged_files/foo.rb", "spec/tagged_files/foo_bar_buttz.rb", "spec/tagged_files/epic_lulz.rb"]
  s.has_rdoc = true
  s.homepage = %q{http://taglob.rubyforge.org}
  s.rdoc_options = ["--main", "README.txt"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{taglob}
  s.rubygems_version = %q{1.1.0}
  s.summary = %q{Dir.taglob selects tagged Ruby files}

  s.add_dependency(%q<hoe>, [">= 1.5.1"])
end
