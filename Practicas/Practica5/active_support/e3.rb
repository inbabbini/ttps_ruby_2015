# ----------------------------------------------------------------
# 3 . Que hacen y en que clase se definen los metodos:
# ----------------------------------------------------------------
# [Object]blank? -> boolean
#   Si el receptor es nil,false,' ','',{},[], o cumple la
#   condicion #empty? == true, se considera blank? == true
#
# [Object]present? -> boolean
#   Si el receptor es nil,false,' ','',{},[], o cumple la
#   condicion #empty? == true, se considera blank? == false
#
# [Object]presence -> receiver/nil
#   Se retorna el receptor en caso blank? == false, nil si no
#
# [Object]try(:method_sym) -> result/nil
#   Si el receptor es nil retorna nil, si no el resultado de
#   hacer receptor.method_sym
#
# [Object]in?(object) -> true/false
#   Si el receptor esta contenido en object, retorna true, lanza
#   una exception si el receptor no responde a #include?
#
# [Module]delegate(:method,:class_to_delegate)
#   Metodo de clase Module, se utiliza en el contexto de la
#   definicion de una clase, es un shortcut a crear un metodo
#   para acceder a un atributo publico de un modelo relacionado
#
# [String]pluralize -> 'pluralized str'
#   Definido en string, usa Reflection para pluralizar las
#   palabras contenidas en el string
#
# [String]singularize -> 'singularized str'
#   Definido en string, usa Reflection para singularizar las
#   palabras contenidas en el string
#
# [String]camelize -> 'CamelCased'
#   Definido en string, utiliza Reflection para detectar las
#   palabras dentro del string y capitalizarlas, generando
#   un string en CamelCase (elimina underscores)
#
# [String]underscore -> 'underscored_str'
#   Definido en string, utiliza Reflection para transformar
#   un string a undercored, como 'AnStr' -> 'an_str'
#
# [String]classify ->  'ClassifiedStr'
#   Definido en string, usa Reflection para transoformar el
#   string a CamelCase, normalizandola a un nombre de modelo
#
# [String]constantize -> Constant
#   Definido en string, intenta resolver el string receptor
#   a una constante definida (el valor), por lo que 'Fixnum'
#   retornaria (Class)Fixnum, '1' retornaria 1, etc
#
# [String]humanize -> 'Humaniced string.'
#   Retorna el string "humanizado", lo pasa por ciertas reglas
#   para hacerlo mas legible y en un formato de escritura
#   mas humano
#
# [Enumerable]sum -> SUM e(0..n)
#   Retorna la sumatoria de todos los elementos del Enumerable
