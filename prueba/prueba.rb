# coding: utf-8
require 'timbradocfdi'

@user_key = "mvpNUXmQfK8="
@timbrado = Timbradocfdi::Generator.new(@user_key)
@rfcEmisor = "AAA010101AAA"

def self.registroEmisor
  contrasena = "12345678a"
  base64Cer = "./cer.cer"
  base64Key = "./key.key"
  puts @timbrado.registroEmisor(@rfcEmisor, base64Cer, base64Key, contrasena)
end

def self.timbraCFDI 
  comprobante = "./comprobanteSinTimbrar.xml"
  puts @timbrado.timbraCFDI(comprobante, 1)
end

def self.obtieneCFDI 
  folioUUID = "E231C693-8871-4CEB-ADD4-DCCBE0BE5FDA"
  puts @timbrado.obtieneCFDI(@rfcEmisor, folioUUID)
end

def self.cancelaCFDI
  folioUUID = "E231C693-8871-4CEB-ADD4-DCCBE0BE5FDA"
  puts @timbrado.cancelaCFDI(@rfcEmisor, folioUUID)
end


puts "Ejecutando prueba"
puts "Registrando emisor: \n"
self.registroEmisor
puts "------------------------------------\n\n"

puts "Timbrando CFDI"
self.timbraCFDI 
puts "------------------------------------\n\n"

puts "Obteniendo CFDI"
self.obtieneCFDI 
puts "------------------------------------\n\n"

puts "Cancelando CFDI"
self.cancelaCFDI 
puts "------------------------------------\n\n"