# ---------------------------------------------------------------
# Que reglas deberia agregarse para que AS pluralize en español
# las palabras terminadas con l, n y r?
# ---------------------------------------------------------------
#
# Deberiamos agregar una regla que matchee con las palabras
# que terminen en l, n y r, y reemplazar esa palabra por ella
# misma + es, por ejemplo:

ActiveSupport::Inflector.inflections(:es) do |inflect|
  inflect.plural(/^(\w+[NnRrLl])$/i , "\1es")
end
