# -----------------------------------------------------------------
# Rails - Environments
# -----------------------------------------------------------------
# - Que son los ambientes en Rails?
#   En terminos de informatica un "ambiente" define como un proceso o
#   una aplicacion se comportará al ejecutarse, normalmente a travez
#   de configuraciones.
#   En particular a Rails, un environment esta definido por un
#   conjunto de configuraciones que se haces sobre la aplicacion
#   (Rails.application)los cuales se diferencian entre si
#   principalmente en qué configuraciones tocan y que valor les es
#   asignado.
#
# - Cual es el sentido de tener y usar diferentes ambientes?
#   Diferentes ambientes cubren diferentes necesidades, es decir,
#   hay tareas que requieren una cierta configuracion (como log de
#   errores, recargar la aplicacion en cada request, ignorar
#   ciertos aspectos de la aplicacion, etc) y es deseable tener
#   una manera facil y practica de definir estos conjuntos de
#   configuraciones y usar cada uno de ellos cuando es necesario.
#   Por ejemplo, Rails define 3 ambientes estandar:
      :development
      :production
      :test
#   Cada uno de estos ambientes define un set de configuraciones
#   propicio para llevar a cabo tareas relacionadas a su nombre.
#   La definicion de estas configuraciones está dada por el
#   archivo correspondiente dentro de app_name/config/environments,
#   como por ejemplo:
#     app_name/config/environments/development.rb
#     app_name/config/environments/production.rb
#     app_name/config/environments/test.rb
#
#
# - Cual es el ambiente por defecto?
#   Por defecto, viene configurado para correr en :development
#
#
