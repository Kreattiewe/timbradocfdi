module Timbradocfdi
  class Generator


    ##
    # Cancela CFDI
    def cancelaCFDI(rfcEmisor, folioUUID)
      
      options = {
        :usuarioIntegrador =>   @user,
        :rfcEmisor         =>   rfcEmisor,
        :folioUUID         =>   folioUUID,
      }

      response = request("cancela_cfdi", options)
      parse_result_cancelaCFDI response.body
    end

  end
end