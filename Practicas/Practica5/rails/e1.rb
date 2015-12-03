# -------------------------------------------------------------
# Ruby on Rails
# -------------------------------------------------------------
# - Que es?
#   Ruby on Rails es un framework para construir aplicaciones
#   web en Ruby. RoR promueve la idea de "convencion sobre
#   configuracion", es decir, hacer uso convenciones para el
#   desarrollo de las aplicaciones, minimizando la configuracion
#   y/o personalizacion, lo cual hace mas sencillo el desarrollo
#   y potencialmente la legibilidad y portabilidad. Por otro
#   lado, Rails tambien promueve SoC (Separation of Concerns),
#   invitando a la modularidad y la cooperacion entre partes,
#   por lo que implementa el patron MVC como base para las
#   aplicaciones.
#
# - De que se compone?
#   Se podria decir que Rails es un conjunto de librerias o gems,
#   cada una llevando una responsabilidad particular dentro del
#   framework (SoC). Rails tambien implmenta codigo propio,
#   mayormente las conexiones entre estas gems, como tambien
#   mucha funcionalidad de tipo "helper".
#

# -------------------------------------------------------------
# Ruby on Rails - Gems/Librerias
# -------------------------------------------------------------
# ActionMailer
#   - Que funcion principal cumple?
#     Framework de manejo de servicios mails, "wrapper de
#     ActionController+Mail", gestiona envio y salida de mail,
#     acciones a ejecutar y permite construir mail usando
#     templates (a la views)
#   - En que parte/s del patrón MVC encaja?
#     Buena pregunta. Servicios? Controller?
#
#
# ActionPack
#   - Que funcion principal cumple?
#     Framework para el manejo de ruteo (manejo de requests) y
#     las consecuentes respuestas. Incluye gems tales como
#     ActionController (controllers, basicamente) y ActionDispatch
#     que maneja requests (paresos, headers, session, cookies,...)
#
#   - En que parte/s del patrón MVC encaja?
#     A mi criterio, encaja en C, ya que de aqui se extiende la
#     construccion de los mismos, y el ruteo (tanto requests y
#     responses) no son parte de la vista en si, si bien se
#     retorna algo generado por una vista (usualmente)
#
#
# ActionView
#   - Que funcion principal cumple?
#     Es un framework para la construccion y renderizacion de
#     vistas a partir de templates. Provee funcionalidad para
#     facilitar esto, como son HELPERS que encapsulan snippets
#     Ruby
#
#   - En que parte/s del patrón MVC encaja?
#     Literalmente V.
#
#
# ActiveJob
#   - Que funcion principal cumple?
#     Framework que permite crear procesos y manejar "jobs"
#     o procesos que correran en segundo plano o no
#     necesariamente dentro del ciclo request-response.
#     Se pueden definir tareas a ejecutarse en algun momento
#     dado, o varias que trabajen concurrentemente. Esta gem
#     le da el backbone a algunas funcionalidades de
#     ActionMailer
#
#   - En que parte/s del patrón MVC encaja?
#     Aplica? No maneja necesariamente modelos, no sale
#     necesariamente por la accion de controlador y no
#     toca nada de vistas.
#
#
# ActiveModel
#   - Que funcion principal cumple?
#     ActiveModel define e implementa (mayormente) interfaces
#     para los modelos (clases), quienes incluyendo e
#     implementando estas APIs se vuelve compatibles con los
#     metodos HELPERS de ActionPack. Esta intefaz es
#     utilizada por los modelos que extienden de ActiveRecord
#     y es definida por el modulo ActiveModel::Model
#
#   - En que parte/s del patrón MVC encaja?
#     Explicitamente M.
#
#
# ActiveRecord
#   - Que funcion principal cumple?
#     Basado en el patron de diseño de mismo nombre,
#     ActiveRecord cumple el papel de ORM en Rails, es
#     decir, conecta las clases/modelos de la aplicacion
#     a bases de datos relacionales, mapeando tanto las
#     clases como las relaciones (asociaciones) entre si.
#     Provee una clase ActiveRecord::Base de la cual
#     debe extender los modelos de la aplicacion (en caso
#     de querer que sean clases persistidas)
#
#   - En que parte/s del patrón MVC encaja?
#     Implementa mayormente logica del modelo, por lo que M
#
#
# ActiveSupport
#   - Que funcion principal cumple?
#     ActiveSupport, como indica su numbre, engloba toda
#     clase, libreria y funcionlidad de utilidad que es
#     considerada util para Rails
#
#   - En que parte/s del patrón MVC encaja?
#     Aplica? Serian como "servicios", una especie de lib
#
