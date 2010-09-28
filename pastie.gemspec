Gem::Specification.new do |s|
  s.name = "pastie-api"
  s.version = "0.1"
  s.date = "2010-09-28"
  s.description = "Pastie.org simplified API with terminal access"
  s.summary = "Pastie.org simplified API with terminal access"
  s.authors = ["Dan Sosedoff"]
  s.email = "dan.sosedoff@gmail.com"
  s.homepage = "http://github.com/sosedoff/pastie"

  # = MANIFEST =
  s.files = %w[
    bin/pastie
    lib/pastie.rb
    lib/pastie/pastie.rb
    lib/pastie/request.rb
    lib/pastie/paste.rb
    lib/pastie/console.rb
  ]
  # = MANIFEST =

  s.executables = ["pastie"]
  s.default_executable = "pastie"

  s.has_rdoc = true
  s.rubygems_version = '1.3.7'
end
