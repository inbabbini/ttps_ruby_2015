VALUE = 'global'

module A
  VALUE = 'A'

  class B
    VALUE = 'B'

    def self.value
      VALUE
    end

    def value
      'iB'
    end
  end

  def self.value
    VALUE
  end
end

class C
  class D
    VALUE = 'D'

    def self.value
      VALUE
    end
  end

  module E
    def self.value
      VALUE
    end
  end

  def self.value
    VALUE
  end
end

class F < C
  VALUE = 'F'
end

# A partir de este codigo, analizar que daria ejecutar lo siguiente:

puts A::value
  # intuicion => 'A', ejecuta el metodo de clase del modulo A
  # irb => 'A'

puts A::B.value
  # intuicion => 'B', ejecuta metodo de clase value de la clase B
  # irb => 'B'

puts C::D.value
  # intuicion => 'D', ejecuta el metodo de clase de la clase D
  # irb => 'D'

puts C::E.value
  # intuicion => deberia explotar? self.value existe pero trata de acceder
  # a VALUE, que no existe ni en el modulo E ni en la clase C, so... BOOM?
  # update: jodido bobo, no me acordé de la definicion global de VALUE
  # irb => 'global'

puts F.value
  # intuicion => 'F', ejecuta self.value heredado, y al buscar VALUE
  # lo encuentra en su propia clase
  # irb => 'global', WTF, el lookup arranca en la superclase?

puts A::value
  # intuicion => 'A', accede a la constante VALUE definida en A
  # irb => 'A'

puts A.new.value
  # intuicion => explota? A no tiene definido un metodo de instancia .value
  # irb => casi, explota porque no se le puede hacer un .new a un modulo (DUH)

puts B.value
  # intuicion => 'B', ejecuta self.value de la clase B, busca VALUE que
  # está definido en class B
  # irb => NOPE, no encuentra la clase B xq esta anidada
  # en un modulo (NAMESPACES AMIGO)

puts D.value
  # intuicion => 'D'? o no encuentra la clase por la anidacion
  # irb => no encuentra la clase por anidacion

puts C.value
  # intuicion => 'global', ejecuta self.value y el lookup de VALUE llega
  # hasta la global
  # irb => 'global'
