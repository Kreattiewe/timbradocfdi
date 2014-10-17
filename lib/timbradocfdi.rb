require 'savon'
require "timbradocfdi/version"
require "timbradocfdi/results"
require "timbradocfdi/register_emisor"
require "timbradocfdi/timbrar"
require "timbradocfdi/obtain"
require "timbradocfdi/cancel"

module Timbradocfdi
  class Generator
  
    BASE_URI = "http://201.175.12.89/serviciointegracionpruebas/Timbrado.asmx?wsdl"
    
    ## 
    # Attributo accesible (lectura y escritura)
    attr_accessor :user, :client

    ##
    # Se inicializa la clase con un usuario y su respectivo cliente con el soap
    def initialize(user)
      @client = Savon.client(wsdl: BASE_URI)
      @user = user
    end


    ##
    # Read certificate and encode to base64
    def file_reader(path)
      raw = File.read(path)
      Base64.encode64(raw)
    end

    ##
    # Method for generate HTTP Request post
    def request(function, options = {})
      operation = function.intern
      @client.call(operation, message: options)
    end

  end
end

