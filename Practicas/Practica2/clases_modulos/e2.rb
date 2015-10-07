# Con respecto a modulos, INCLUDE y EXTEND sirven para generar mix-ins, la
# diferencia reside en que cada uno agrega la funcionalidad definida por el
# modulo a diferentes partes. Veamos un ejemplo

#Un modulo bastante simple

module Talkative
  def say_hello
    puts 'HELLOOOOOOOO!!!!'
  end
end

#Usando INCLUDE, los metodos definidos por el modulo terminan siendo de INSTANCIA

class Person
  include Talkative
end

Person.new.say_hello # => HELLOOOOOOOO!!!!
Person.say_hello # => noMethodError

#Usando EXTEND, los metodos definidos por el modulo terminan siendo de CLASE

class Computer
  extend Talkative
end

Computer.new.say_hello # => noMethodError
Computer.say_hello # => HELLOOOOOOOO!!!!
