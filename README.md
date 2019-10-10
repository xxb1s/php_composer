*spanish / español*

# Servidor PHP-FPM Composer

Imágen de Docker especial para recibir un proyecto Laravel >= 5

### Especificaciones

* PHP-FPM: 7.3
* Composer: La [versión](https://getcomposer.org/doc/faqs/how-to-install-composer-programmatically.md) más actual

*Funciona bellisimo con un contenedor NGINX :heart: o sin él tambien :stuck_out_tongue_winking_eye:*

### Uso

* Descarga la imágen desde [Docker HUB](https://hub.docker.com/r/cbrghton/php_fpm_composer_tools/)
  
  ```
  docker pull cbrghton/php_fpm_composer_tools
  ```



* Construye la imágen desde tu local:
  
  1. Clona el repositorio a tu local
     
     ```
     git clone git@github.com:cbrghton/php_composer.git
     ```
  
  2. Ingresa a la carpeta y ejecuta el siguiente comando para construir la imágen
     
     ```
     ./build.sh
     ```
  
  3. Listo! Ya tienes tu imágen
     
     > Si necesitas personalizarla solo modifica `Dockerfile.example` y repite el paso 2

***

*english / inglés*

# PHP-FPM Composer Server

Docker image for Laravel project >= 5

### Specifications

* PHP-FPM: 7.3
* Composer: [Latest](https://getcomposer.org/doc/faqs/how-to-install-composer-programmatically.md)

*Works lovely with NGINX Container :heart: or without it too :stuck_out_tongue_winking_eye:*



### Usage

* Download docker image from [Docker HUB](https://hub.docker.com/r/cbrghton/php_fpm_composer_tools/)
  
  ```
  docker pull cbrghton/php_fpm_composer_tools
  ```



* Build it from local
  
  1. Clone repository from your local
     
     ```
     git clone git@github.com:cbrghton/php_composer.git
     ```
  
  2. Move inside the repository and execute follow command to build the image
     
     ```
     ./build.sh
     ```
  
  3. Ready! You have the image
     
     > If you need customize the image only modify `Dockerfile.example` and repeat the step 2
