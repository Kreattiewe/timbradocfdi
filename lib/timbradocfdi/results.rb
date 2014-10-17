# coding: utf-8
module Timbradocfdi
  class Generator

    ##
    # Parse result for registro emisor
    def parse_result_registro_emisor(result)
      object        = result.to_hash
      result_object = object[:registra_emisor_response][:registra_emisor_result][:any_type]

      {
        code: result_object[1],
        message: (result_object[2].to_s).encode("utf-8")
      }
    end
    
    ##
    # Parse result for timbraCFDI
    def parse_result_timbraCFDI(result)
      object = result.to_hash
      result_object = object[:timbra_cfdi_response][:timbra_cfdi_result][:any_type]

      if result_object[1].to_i === 0 
        return_object = {
          code: 0,
          xml: result_object[3],
          qr: result_object[4],
          details: result_object[5]
        }
      else
        return_object = {
          code: result_object[1],
          message: result_object[2]
        }
      end

      return_object
    end

    ##
    # Parse result for obtieneCFDI
    def parse_result_obtieneCFDI(result)
      object = result.to_hash
      result_object = object[:obtiene_cfdi_response][:obtiene_cfdi_result][:any_type]

      if result_object[1].to_i === 0 
        return_object = {
          code: 0,
          xml: result_object[3],
          qr: result_object[4],
          details: result_object[5]
        }
      else
        return_object = {
          code: result_object[1],
          message: result_object[2]
        }
      end
    end

    ##
    # Parse result for cancelaCFDI
    def parse_result_cancelaCFDI(result)
      object = result.to_hash 
      result_object = object[:cancela_cfdi_response][:cancela_cfdi_result][:any_type]

      {
        code: result_object[1],
        message: (result_object[2].to_s).encode("utf-8")
      }
    end

  end
end