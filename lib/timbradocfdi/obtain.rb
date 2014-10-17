module Timbradocfdi
  class Generator


    ##
    # Registro emisor
    def obtieneCFDI(rfcEmisor, folioUUID)
      
      options = {
        :usuarioIntegrador =>   @user,
        :rfcEmisor         =>   rfcEmisor,
        :folioUUID         =>   folioUUID,
      }

      response = request("obtiene_cfdi", options)
      parse_result_obtieneCFDI response.body
    end

  end
end