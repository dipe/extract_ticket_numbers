# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'extract_ticket_numbers/version'

Gem::Specification.new do |spec|
  spec.name          = "extract_ticket_numbers"
  spec.version       = ExtractTicketNumbers::VERSION
  spec.authors       = ["Peter Ehrenberg"]
  spec.email         = ["pe@dipe.de"]
  spec.summary       =
    %q{Reads CSV file, extract Jira ticket number from each line an add it as additional column.}
  spec.description   =
    %q{It's build for using with our time tracking system BlueAnt. If you get a file with a work time report as CSV file, you can feed it to this extract_ticket_numbers. This program reads every line an try to match a ticket number looking like "ABC-123". If it found such number it will add it in to an additional last column of the CSV file.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "thor"
end
