# ---------------------------------------------------------------
# Rails - Routing
# ---------------------------------------------------------------
# 1-Donde se definen la rutas de la application?
#   Por defecto, Rails provee el archivo config/routes.rb, el
#   cual provee un espacio para definir todas las rutas de la
#   aplicacion de forma jerarquica.
#
# 2-De que formas se pueden definir las rutas?
#   La sintaxis para definir rutas esta especificada en este
#   archivo a travez de varios ejemplos que abarcan algunos
#   aspectos y utilidades a la hora de generar rutas, como
#   son las rutas parametrizadas, los grupos de rutas, definicion
#   del root de la pagina (el '/').
#   Ademas de armar rutas a mano, existen algunos generators que
#   agregan rutas a este archivo, como es el generator de
#   controllers, o hasta podrian crearse generators propios que
#   agreguen rutas
#
# 3-Que rutas agrego el generator 'controller' usado en e7-3?
#   El generator controller generó una ruta por cada una de sus
#   acciones, en el caso de polite_controller solo una ruta para
#   la unica accion 'salute'
#
# 4-Con que comando podes cunsultar las rutas definidas?
#   Segun una nota en el archivo routes.rb, utilizando un comando
#   de CLI propio de Rake, especificamente '$ rake routes'
