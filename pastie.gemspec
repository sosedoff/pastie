Gem::Specification.new do |s|
  s.name = "pastie-api"
  s.version = "0.2.0"
  s.date = "2010-10-17"
  s.description = "Simple API and shell access to Pastie.org"
  s.summary = "Simple Pastie.org API"
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
    lib/pastie-api/history.rb
  ]
  # = MANIFEST =

  s.executables = ["pastie"]
  s.default_executable = "pastie"

  s.has_rdoc = true
  s.rubygems_version = '1.3.7'
end