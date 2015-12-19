# -----------------------------------------------------------
# 1 - Que es una gema? Para que sirve? Que estructura tienen?
# -----------------------------------------------------------
# Una gema es una forma modular y estandarizada de encapsultar
# cierta funcionalidad/codigo, desde simples funciones a
# grandes librerias/frameworks, los cuales pueden ser distribuidos
# y compartidos rapidamente.
#
# De esta manera, las gemas permiten reutilizar codigo en
# distintos proyectos, facilita el mantenimiento de codigo
# al centralizarlo, y permite compartirlo con la comunidad
# a travez de plataformas como RubyGems
#
# Cada gema tiene definidos
  # Nombre
  # Version (x.y.z)
  # Plataforma (ruby, jruby, ...)
# Ademas, cada gema cuenta con 3 componentes definidas:
  #Codigo:
    #implementacion + tests + binaries + rakefile
  #Documentacion
    #README
  #gemspec
    #archivo que describe y contiene informacion
    # sobre la gema

# -----------------------------------------------------------
# 2 - diferencias entre el comando gem y Bundler ?
# -----------------------------------------------------------
# gem es un comando (actualmente incluido en ruby por defecto)
# que permite interactuar directamente con RubyGems para
# llevar a cabo acciones como:
  # buscar gems
  # instalar gems
  # instalar una gem y sus dependencias
  # desintalar gems
  # listar gemas instaladas
  # descargar gems y descomprimirlas
  # ver documentacion de las gems

# Bundler es una gem, la cual se encarga de manejar
# dependencias a travez de archivos estructurados (Gemfiles) que
# especifican tanto SOURCES como DEPENDENCIES para diferentes
# ambientes de desarrollo (definibles). Esto facilita y
# automatiza la consistencia de los ambientes, instalando y
# desinstalando gems automaticamente.
# Bundler permite llevar "snapshots" de las gemas y sus versiones
# a travez del archivo Gemfile.lock, el cual lista todas las gems
# (depencias del proyecto) y las gems requeridas por esas gems
# (dependencias de dependencias)

# -----------------------------------------------------------
# 3 - donde instalan gemas los comandos gem y bundle?
# -----------------------------------------------------------
# Para ver donde esta instalada una gema en particular instalada
# con gem existe el comando:

  # gem which GEM_NAME
  # => /path/to/gem/lib/gem.rb

#Por ejemplo, despues de instalar bundler

  # gem which bundler
  # => /home/iron/.rbenv/versions/2.2.3/lib/ruby/gems/2.2.0/gems/bundler-1.10.6/lib/bundler.rb

# Intuyo que el comando gem instala las gems en el enviroment
# que se esta usando al momento de ejecutar el "gem install GEMNAME"

# Por otro lado, para ver donde Bundler instala las gemas, existe
# el comando:

  # bundle show [GEM_NAME]

# Si no se le pasa GEM_NAME,lista todas las dependencias (Gemfile)
# del proyecto. Si le es pasado GEM_NAME, retorna el path hacia
# donde esta instalada la gema (debe estar requerida en el proyecto)

# -----------------------------------------------------------
# 4 - para que sirve el comando 'gem server' ?
# -----------------------------------------------------------
# Este comando levanta un server el cual sirve tanto para
# ver la documentacion de las gemas instaladas (RDoc) como
# para proxiar la instalacion de gemas en otras maquinas

# -----------------------------------------------------------
# 5 - Smenatic Versioning
# -----------------------------------------------------------
# - Que es?
#   Semantic Versioning o SemVer es un estandar (mas alla de ruby)
#   el cual propone utilizar una politica de versionado compuesta
#   por una serie de reglas que definen el significado y
#   la profundidad de un cambio en el numero de version, justamente
#   dandole una semantica, un sentido implicito, a los numeros del
#   versionado

# - Finalidad?
#   Darle un sentido claro y estricto al esquema de versionado
#   permite mantener un sistema de dependencias relativamente
#   flexible y confiable, como tambien poder saber exactamente que
#   significa el cambio en la version y que impactos puede tener,
#   cosas a tener en cuenta a la hora de actualizar dependencias

# - Composision de una version
#   SemVer establece que toda version se compone de 3 digitos separados
#   por puntos:
#
#     X.Y.Z
#
#   donde el cambio de cada uno de estos tiene un significado particular:
#
#     Z: cambios menores, mayormente de implementacion, como bugfixes
#     Y: cambios medianos, no compromenten la retrocompatibilidad, como
#     puede ser funcionalidad nueva
#     X: cambios grandes, los cuales pueden comprometer la
#     retrocompatibilidad, como puede ser cambios rotundos en funcionalidad
#     existente
#
