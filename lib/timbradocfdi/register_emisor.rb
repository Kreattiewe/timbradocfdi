module Timbradocfdi
  class Generator


    ##
    # Registro emisor
    def registroEmisor(rfcEmisor, base64Cer, base64Key, contrasena)
      
      options = {
        :usuarioIntegrador =>   @user,
        :rfcEmisor         =>   rfcEmisor,
        :base64Cer         =>   file_reader(base64Cer),
        :base64Key         =>   file_reader(base64Key),
        :contrasena        =>   contrasena
      }

      response = request("registra_emisor", options)
      parse_result_registro_emisor response.body
    end

  end
end