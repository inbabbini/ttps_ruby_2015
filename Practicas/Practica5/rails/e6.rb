#-----------------------------------------------------------------
# Rails - Initializers
#-----------------------------------------------------------------
# 1-Que son?
#   Los initializers son todos los archivos de extension
#   .rb dentro de la carpeta config/initializers, o de sus
#   sub-directorios. Estos archivos pueden contener codigo,
#   usualmente de configuracion, tareas a ejecutarse, etc.
#
# 2-En que momento se ejecutan?
#   Estos archivos se ejecutarán una vez cargado el framework
#   y sus dependencias, es decir las gems
#
# 3-Al modificarse, se reflejan los cambios hechos si la
#   aplicacion esta corriendo?
#   No, ya que estos se ejecutan solo una vez luego de la
#   carga del framework
#
# 4-Bootlogger
#   Para crear un initializer que avise que la aplicacion
#   esta booteando, creamos un nuevo archivo .rb en la
#   carpeta config/initializers, en este caso bootlogger.rb,
#   que contiene la siguiente linea
#
      puts "Booting practica_cinco"
#
#   Este mensaje se muestra entre la carga del framework y
#   la carga del WebServer
