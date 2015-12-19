# ---------------------------------------------------------------
# Como extiende ActiveSupport al core de Ruby?
# ---------------------------------------------------------------
# ActiveSupport esta hecho de tal manera que la carga de la
# gem 'active_support' por default no carga ninguna extension,
# sino que estas deben ser cargadas manualmente, seleccionando
# lo que uno quiere que se cargue (esto en el caso de usar AS
# de manera independiente, Rails por defecto carga todo).
# ActiveSupport esta partido de manera que cada metodo agregado
# a cada clase se pueda cargar individualmente:
#
  require 'active_support'
  require 'active_support/core_ext/class_name/method_name.rb'
#
# o si se quiere tambien se pueden cargar todos los metodos
# correspondientes a una clase:
#
  require 'active_support'
  require 'active_support/core_ext/class_name'
#
# o directamente cargar toda la extencion al core
#
  require 'active_support'
  require 'active_support/core_ext'
#
# o para cargar todo ActiveSupport
#
  require 'active_support'
  require 'active_support/all'
#
