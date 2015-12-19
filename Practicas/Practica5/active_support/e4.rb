# --------------------------------------------------------------
# Se puede extender las inflecciones de ActiveSupport?
# --------------------------------------------------------------
# En el archivo config/initializers/inflections.rb se definen
# reglas de infleccion sobre el singleton de inflecciones
# definido por Rails, retornado por el mensaje
#
    ActiveSupport::Infletor.inflections(locale_sym = :en)
#
# Para definir estas inflecciones se puede pasar un symbol
# que define en que locale toma efecto dicha regla de infleccion.
# Se permiten definir varios tipos de inflecciones, tales como
#
#   inflect.acronym word
#   inflect.human match, replacement
#   inflect.singular match, replacement
#   inflect.plural match, replacement
#   inflect.uncountable match, replacement
#
# Cada uno de estos mensajes recive 2 parametros
#
#   - match: algo con lo que la palabra debe matchear, sea un
#     string o una expresion regular
#   - replacement: con que se reemplaza si matchea la palabra,
#     pudiendo ser un string o alguna expresion regular que
#     haga referencia a match
