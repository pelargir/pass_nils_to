Gem::Specification.new do |s|
  s.name     = "pass_nils_to"
  s.version  = "0.5"
  s.date     = "2008-08-15"
  s.summary  = "Pass nils to your methods and see if they explode."
  s.email    = "pelargir@gmail.com"
  s.homepage = "http://github.com/pelargir/pass_nils_to"
  s.description = "Pass nils to your methods and see if they explode."
  s.has_rdoc = true
  s.authors  = ["Matthew Bass"]
  s.files    = [
    "CHANGELOG",
    "MIT-LICENSE",
    "Rakefile",
		"README",
		"pass_nils_to.gemspec",
		"lib/pass_nils_to.rb",
		"test/pass_nils_to_test.rb",
		"test/pass_nils_to/browser_test.rb"
		]
  s.rdoc_options = ["--main", "README"]
  s.extra_rdoc_files = ["README"]
end