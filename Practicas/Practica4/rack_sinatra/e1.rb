#-----------------------------------------------------------
# 1 - Rack
#-----------------------------------------------------------
# - Que es?
#   Principalmente, Rack es una definición de una interfaz
#   para la comunicacion entre WebServer y ApplicationServer
#   o lo que se encarge de procesar las requests que le
#   llegan a dicho WebServer. Por otro lado, Rack tambien
#   es una Gem, la cual provee mucha funcionalidad y
#   herramientas para armar facilitar la construccion de
#   dicho AppServer, como tambien Middlewares para el mismo,
#   procesamiento y analisis de requests/responses
#
# - Que define?
#   Rack define una interfaz que cualquier WebServer
#   compatible con Rack cumple. Estos WebServers, dado un
#   request, ejecutan un metodo 'call' sobre un objeto que
#   les es dado y retornan una response que es el resultado
#   de ejecutar un 'call' sobre dicho objeto.
#
# - Que requisitos impone?
#   La interfaz que define Rack es simple. Todo WebServer
#   compatible debe interactuar con un objeto (tan simple
#   como una instancia de una clase o complejo como un
#   framework tales como Sinatra, RubyOnRails, etc) el cual
#   debe implementar un metodo 'call(env)', el cual recibe
#   como parametro un hash de entorno (env) y retorna un
#   array compuesto por 3 partes:
#
#     [status, headers, body]
#
#   Donde:
#     - Status: codigo de estado
#       200, 404, 403, ...
#
#     - Headers: un hash compuestos por los headers de
#       la respuesta.
#       {"Content-type" => "text/html", ...}
#
#     - Body: el cuerpo de la respuesta, encapsulado en
#       algun objeto que responda a 'each' (normalmente
#       un array)
#       ['Hello!']
#       Un JSON: ['{'key' : 'value'}']
