# Con respecto a modulos, INCLUDE y EXTEND sirven para generar mix-ins, la
# diferencia reside en que cada uno agrega la funcionalidad definida por el
# modulo a diferentes partes. Veamos un ejemplo

#Un modulo bastante simple

module Greeter
  def say_hello
    puts 'HELLOOOOOOOO!!!!'
  end
end

#Usando INCLUDE, los metodos definidos por el modulo terminan siendo de INSTANCIA

class Person
  include Greeter
end

Person.new.say_hello # => HELLOOOOOOOO!!!!
Person.say_hello # => noMethodError

#Usando EXTEND, los metodos definidos por el modulo terminan siendo de CLASE

class Computer
  extend Talkative
end

Computer.new.say_hello # => noMethodError
Computer.say_hello # => HELLOOOOOOOO!!!!

#ejemplo boludo del "patron" para agregar metodos de clase e instancia con
# el mismo mixin (haciendo include)

module Talkative

  module TalkativeClassMethods
    def default_message
      @@default_message ||= 'Hi, im'
    end

    def default_message=(message)
      @@default_message = message
    end
  end

  def name
    @name ||= 'Default'
  end

  def name= (nombre)
    @name = nombre
  end

  def say_hi
    puts  self.class.default_message + ' ' + name
  end

  def self.included(base)
    base.extend(TalkativeClassMethods)
  end

end

module Programmable

  def programs(sym = nil)
    if sym != nil
      self.programs[sym] || nil
    else
    @programs ||= {}
    end
  end

  def install(sym, program_message)
    self.programs[sym] =  program_message
  end

  def unistall(sym)
    self.programs.delete(sym)
  end

  def access(sym)
    if self.installed?(sym)
      puts 'Running ' + sym.to_s + ': ' + self.programs(sym)
    else
      puts sym.to_s + ' not installed'
    end
  end

  def installed?(sym)
    self.programs[sym] ? true : false
  end

end

class Pc
  include Talkative
  include Programmable
end
