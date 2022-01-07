
# Dna Checker

API Rails para verificacion de muestras de ADN e indicar si contiene marcadores mutantes.

Puede visitarla en https://dna-check.herokuapp.com

## Herramientas usadas:
* Ruby 3.0.2
* Rails 7
* PostgreSQL
* Rspec

## Uso:

La App Expone un endpoint en `/mutant` que recibe peticiones `POST` con la muestra de ADN a verificar como parametro, dicha muestra
debe ser un JSON como:

```
{
  "dna": ["ATGCGA","CAGTGC","TTATGT","AGAAGG","CCCCTA","TCACTG"]
}
```

La API entonces respondera un HTTP `200-OK` en caso de que la muestra analizada sea mutante, o un HTTP `403-Forbidden`
en caso de que la muestra no contenga marcadores mutantes.

La API Tambien expone el endpoint `/stats` que acepta peticiones `GET` y en la que devuelve en un JSON las estadisticas de las verificaciones de muestras de ADN recibidas.

### Ejemplos

#### peticiones a `/mutant`
Aca se muestra un ejemplo de una peticion al endpoint realizado con [HTTPie](https://httpie.io/)

```
 http -v POST 'https://dna-check.herokuapp.com/mutant'  dna:='["ATGCGA","CAGTGC","TTATGT","AGAAGG","CCCCTA","TCACTG"]'

```

Ejemplo de respuesta obtenida:
```
HTTP/1.1 200 OK
Cache-Control: max-age=0, private, must-revalidate
Connection: keep-alive
Content-Type: application/json; charset=utf-8
Date: Fri, 07 Jan 2022 13:29:18 GMT
Etag: W/"6ca9381e64e05e21714f63125a742aff"
Referrer-Policy: strict-origin-when-cross-origin
Server: Cowboy
Transfer-Encoding: chunked
Via: 1.1 vegur
X-Content-Type-Options: nosniff
X-Download-Options: noopen
X-Frame-Options: SAMEORIGIN
X-Permitted-Cross-Domain-Policies: none
X-Request-Id: d7d277ac-d81f-4118-9acf-a64b85950bff
X-Runtime: 0.070757
X-Xss-Protection: 0

{
    "mutant": true
}

```


#### peticiones a `/stats`

```
 http -v GET 'https://dna-check.herokuapp.com/stats'
```
Ejemplo de respuesta obtenida:
```
HTTP/1.1 200 OK
Cache-Control: max-age=0, private, must-revalidate
Connection: keep-alive
Content-Type: application/json; charset=utf-8
Date: Fri, 07 Jan 2022 13:39:00 GMT
Etag: W/"4324e1e05a72be8d88f7427e886a2809"
Referrer-Policy: strict-origin-when-cross-origin
Server: Cowboy
Transfer-Encoding: chunked
Vary: Accept
Via: 1.1 vegur
X-Content-Type-Options: nosniff
X-Download-Options: noopen
X-Frame-Options: SAMEORIGIN
X-Permitted-Cross-Domain-Policies: none
X-Request-Id: b189135e-6d04-47c4-aef2-62ca3c7c9b9b
X-Runtime: 0.041222
X-Xss-Protection: 0

{
    "count_human_dna": 1,
    "count_mutant_dna": 1,
    "ratio": 1
}
```

## Testing
La aplicacion contiene algunos test basicos escritos con `Rspec` para verificar el correcto funcionamiento de sus componentes primordiales, para ejecutar el test,  estanto en una terminal ubicado dentro de la carpeta del projecto,, ejecutar el comando:
```
rspec
```

