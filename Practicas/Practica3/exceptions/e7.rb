# Se quiere implementar un tipo de exception que indique que la entrada
# del usuario ingresada (ver e6.rb) no es un valor numérico entero
# valido.
# Dado que lo que representa esta exception es que la entrada no es del
# tipo esperado, asumo que lo ideal seria extender una nueva clase de
# exception de la clase TypeError

class NonValidIntegerError < TypeError

  # def message
  #   'Given input is not a valid integer of type Fixnum'
  # end

end
