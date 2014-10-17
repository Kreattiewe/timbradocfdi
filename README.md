# Timbradocfdi

TODO: Write a gem description

## Instalación

Agrega esta linea a tu gemfile

    gem 'timbradocfdi'

y Ejecuta

    $ bundle

o instala la gema en tu sistema

    $ gem install timbradocfdi

## Forma de uso

Se tienen 4 operaciones las cuales son ``` registra_emisor, timbra_cfdi, obtiene_cfdi y cancela_cfdi ``` 

para el uso adecuado de las operaciones lo primero que debemos es instanciar nuestra clase con nuestra respectiva llave unica y privada de usuario

``` ruby 
@timbrado = Timbradocfdi::Generator.new("aca nuestra llave de usuario")
``` 

asi ya tenemos nuestro cliente instanciado en la variable **@timbrado** con la cual podemos generar las 4 operaciones


### Registra_emisor

para registrar un emisor se requiere **rfcemisor, llave .cer, llave .key y contraseña**

**Ejemplo de uso**

``` ruby
rfcemisor   = "12345"
contrasena  = "contraseña"
base64Cer   = "ruta de nuestra llave cer"
base64Key   = "ruta de nuestra llave key"
@timbrado.registroEmisor(rfcEmisor, base64Cer, base64Key, contrasena)
``` 

se obtiene un objeto con un codigo y un mensaje indicandonos el estado de la peticion ejemplo


``` ruby 
{
       :code => "0",
    :message => "El certificado fue guardado y registrado correctamente"
}
``` 

### Timbra_cfdi

Para timbrar un CFDI se require **Comprobante en xml, y el id de nuestro comprobante**

**Ejmplo de uso** 

``` ruby 
comprobante   = "ruta de nuestro comprobante en xml"
idcomprobante = 1 #Ejemplo

@timbrado.timbraCFDI(comprobante, idcomprobante)
``` 

se obtiene un objeto con un codigo, un xml, una imagen qr y unos detalles de la peticion en caso de ser exitosa, de lo contrario mostrar el codigo y un mensaje de error 

``` ruby 
{
  :code => "0",
  :xml => "ACA RETORNA EL CONTENIDO DE UN XML",
  :qr => "ACA RETORNA EL CONTENIDO DE UNA IMAGEN QR EN BYTES"
  :details => "Detalles como el uid, fecha de la transaccion, etc"
}
```

### Obtiene_cfdi

Para obtener un CFDI se requiere unicamente del **UID del folio** y retorna al igual que al timbrar su respectivo **xml, imagen qr y detalles**

**Ejemplo de uso**

``` ruby
folioUUID = "XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXX"  #Prueba
@timbrado.obtieneCFDI(@rfcEmisor, folioUUID)
``` 

Se obtiene como se indica anteriormente, **xml, imagen qr, detalles** de la peticion

``` ruby 
{
  :code => "0",
  :xml => "ACA RETORNA EL CONTENIDO DE UN XML",
  :qr => "ACA RETORNA EL CONTENIDO DE UNA IMAGEN QR EN BYTES"
  :details => "Detalles como el uid, fecha de la transaccion, etc"
}
```


### Cancela_cfdi

Para cancelar un CFDI se requiere unicamente del **UID del folio** 

**Ejemplo de uso**

``` ruby
folioUUID = "XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXX"  #Prueba
@timbrado.cancelaCFDI(@rfcEmisor, folioUUID)
``` 

Se obtiene un codigo del estado con su respectivo mensaje 

``` ruby
{
       :code => "202",
    :message => "UUID Previamente cancelado"
}
```


## Errores

Aca se describe codigos y mensajes que puede responder la gema

| Codigo  |  Mensaje                                                          |
|---------|-------------------------------------------------------------------|
| 0       | Resultado exitoso                                                 |
| 1       | El usuario Integrador no existe                                   |
| 2       | Timbres agotados, favor de contactar al proveedor (Integrador)    |
| 3       | El emisor no ha sido registrado o se encuentra inactivo (Bloqueado)  |
| 4       | El certificado del emisor no es vigente y el comprobante no puede ser sellado  |
| 5       | Ocurrió un error al sellar el comprobante                         |
| 6       | Timbres agotados, favor de contactar al proveedor (Emisor)        |
| 7       | El archivo .cer es inválido                                       |
| 8       | El archivo .key es inválido                                       |
| 9       | El certificado no es de sello, verifica que los archivos no sean de la FIEL  |
| 10      | La vigencia del certificado ya expiró                             |
| 11      | El certificado no pertenece al RFC del Emisor                     |
| 12      | La contraseña del sello es inválida                               |
| 13      | El certificado no pertenece a la llave privada                    |
| 14      | El certificado aún no se encuentra registrado en el SAT, favor de intentarlo más tarde  |
| 15      | Ocurrió un error al guardar el certificado, por favor contactar al proveedor  |
| 16      | Emisor no registrado                                              |
| 17      | Error al obtener cfdi                                             |
| 18      | Error de cancelación                                              |


## Contributing

1. Fork it ( https://github.com/kreattiewe/timbradocfdi/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
