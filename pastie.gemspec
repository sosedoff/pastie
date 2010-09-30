Gem::Specification.new do |s|
  s.name = "pastie-api"
  s.version = "0.1.1"
  s.date = "2010-09-30"
  s.description = "Pastie.org simplified API with terminal access"
  s.summary = "Pastie.org simplified API with terminal access"
  s.authors = ["Dan Sosedoff"]
  s.email = "dan.sosedoff@gmail.com"
  s.homepage = "http://github.com/sosedoff/pastie"

  # = MANIFEST =
  s.files = %w[
    bin/pastie
    lib/pastie-api.rb
    lib/pastie-api/pastie.rb
    lib/pastie-api/request.rb
    lib/pastie-api/paste.rb
    lib/pastie-api/console.rb
  ]
  # = MANIFEST =

  s.executables = ["pastie"]
  s.default_executable = "pastie"

  s.has_rdoc = true
  s.rubygems_version = '1.3.7'
end
