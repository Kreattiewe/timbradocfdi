# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'timbradocfdi/version'

Gem::Specification.new do |spec|
  spec.name          = "timbradocfdi"
  spec.version       = Timbradocfdi::VERSION
  spec.authors       = ["Angel Botto"]
  spec.email         = ["angelbotto@gmail.com"]
  spec.summary       = "Timbrado CFDI y recibos de nómina por webservice"
  spec.description   = "Timbra tus recibos de nómina y comprobantes fiscales por webservice desde tu sistema o ERP sin complicaciones ¡Sin costo de conexión!. Descarga nuestro kit de integración con ejemplos en diferentes lenguajes y un ambiente para que hagas pruebas sin costo ¡ahora!"
  spec.homepage      = "http://kreattiewe.com"
  spec.license       = "MIT"

  spec.files         = [`git ls-files -z`.split("\x0")]
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rspec", "~> 3.1"
  spec.add_development_dependency "rake", "~> 0"
end
