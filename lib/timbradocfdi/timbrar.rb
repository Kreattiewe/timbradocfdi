module Timbradocfdi
  class Generator


    ##
    # TimbraCFDI
    def timbraCFDI(xmlComprobante, idComprobante)

      options = {
        :usuarioIntegrador    =>   @user,
        :xmlComprobanteBase64 =>   file_reader(xmlComprobante),
        :idComprobante        =>   idComprobante,
      }

      response = request("timbra_cfdi", options)
      parse_result_timbraCFDI response.body
    end

  end
end