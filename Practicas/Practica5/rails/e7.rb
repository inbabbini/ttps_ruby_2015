#----------------------------------------------------------------
# Rails - Generators
#----------------------------------------------------------------
# 1-Que son? Que beneficios trae su uso?
#   Los generators son basicamente scripts que facilitan la
#   creacion de nuevo contenido en la aplicacion, como pueden
#   ser nuevos archivos de inicializacion, controllers, vistas,
#   archivos de configuracion, ambientes, etc. Tener en cuenta
#   que el comando de CLI '$ rails new app_name' basicamente
#   ejecuta un generator que crea una aplicacion Rails limpia.
#   Se pueden crear generators propios, y se puede ver
#   cuales vienen por defecto usando el subcomando de CLI
#   '$ rails generate' sin argumentos.
#   Contar con estos scripts agiliza la creacion de nuevo
#   contenido ya que automatiza gran parte del trabajo al
#   crear los archivos necesarios y llenarlos con el codigo
#   necesario para que funcionen, o al menos partes como
#   para que despues sea necesario solo tocar detalles
#
# 2-Con que comando poder consultar los generators disponibles?
#   Se puede ver los generators que puede usar la aplicacion
#   usando el subcomando de CLI '$ rails generate' sin argumentos
#
# 3-Crear un PoliteController que tenga una accion 'salute' la
#   cual responde un saludo entre 5  saludos diferentes
#   de manera aleatoria
#   Primero, usamos el generator 'controller' para crear un
#   controlador, podemos ver la ayuda usando el comando
#   '$ rails generate controller --help'. Para efectivamente
#   crear el controller, deberiamos usar el comando de CLI
#   '$ rails generate controller polite salute', donde:
#
#     -controller : el generator
#     -polite : argumento al gnrtr, se concatena como nombre
#     -salute : argumento al gnrtr, nombre de una accion
#
#   Este comando generará los siguientes archivos/codigo:
#
#     - app/controllers/polite_controller.rb
#     - accion 'salute' en polite_controller.rb
#     - ruta get 'polite/salute' en config/routes.rb
#     - carpeta app/views/polite
#     - archivo app/views/polite/salute.html.rb
#     - archivo app/helpers/polite_helper.rb
#     - archivo test/controllers/polite_controller_test.rb
#
#   En general, archivos y codigo que necesitaremos rellenar
#   con nuestra logica, pero proveen una estructura.
#   Una vez que estan los archivos, deberiamos implementar
#   la logica en controllers/polite_controller.rb, y
#   modificar la vista views/polite/salute.html.erb para
#   que muestre el saludo (la comunicacion controller-view
#   esta implicita pero se puede explicitar usando 'render')
