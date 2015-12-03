#------------------------------------------------------------------
# Pasos para construir una aplicion Rails
#------------------------------------------------------------------
# 1 - Descargar Rails
#     Primero que nada hay que obtener Rails, ya sea "a mano":
#
        $ gem install rails
#
#     O usando Bundler para generar el ambiente de desarrollo:
#
        Gemfile
          source '...'
          gem 'rails'
#
#
# 2 - Crear proyecto nuevo
#     Una vez descargado Rails y todas sus dependencias, Rails
#     agrega el comando 'rails' al CLI, el cual tiene una extensa
#     funcionalidad. Particularmente, el sub comando 'rails new'
#     facilita la creacion de un nuevo proyecto Rails basico.
#     Este comando acepta varios parametros, por facilidad solo
#     usando el primero para especificar el nombre es suficiente,
#     de tal manera que ejecutar (en el caso de bajarlo a mano):
#
        $ rails new app_name
#
#     O en el caso de estar usando Bundler
#
        $ bundle exec rails new app_name
#
#     Esto nos crea un subdirectorio dentro del directorio en
#     el que estamos parados (CWD) con el nombre 'app_name'. Este
#     posee una estructura predeterminada y varios archivos
#     preconfigurados siguiendo los estandares de Rails. Es
#     importante notar que en este directorio se encuentra el
#     Gemfile que define tanto las dependencias del proyecto como
#     tambien los environments predefinidos de Rails, development
#     y production. Por defecto este Gemfile requiere la gem
#     'sqlite3' por lo que ya incluye la base de datos SQLite
#
#
# 3 - Ejecutar la aplicacion
#     La aplicacion ya está lista para ejecutarse, solo falta
#     posicionarse en el directorio 'app_name' y usando el
#     comando:
#
        bundle exec rails s
#       NOTA: se puede ejecutar solo con 'rails s' pero esto
#       estaria pasando por arriba de los environments y
#       requires del Gemfile, creo
#
#     Rails levanta un servidor que hostea la app y escucha
#     en el puerto 3000 (por defecto)
