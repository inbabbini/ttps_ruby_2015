module Countable

  #metodos que terminaran siendo parte de la clase
  module ClassMethods

    def count_invocations_of(sym)
      #renombramos el metodo de instancia a trackear
      alias_method ('old' + sym.to_s).to_sym, sym
      #agregamos los methods que acabamos de renombrar
      self.send(:define_method,sym){self.call_to_method(sym); self.send(('old' + sym.to_s).to_sym)}
    end

  end

  #metodos de instancia

  def method_calls
    @method_calls ||= Hash.new(0)
  end

  def call_to_method(sym)
    method_calls[sym] += 1
  end

  def invoked?(sym)
    if !method_calls.has_key?(sym)
      raise RuntimeError, 'Non tracked method requested'
    end
    method_calls[sym]  > 0
  end

  def invoked_times(sym)
    if !method_calls.has_key?(sym)
      raise RuntimeError, 'Non tracked method requested'
    end
    method_calls[sym]
  end

  #metodo recive como parametro la clase q lo esta incluyendo al momento
  #de la inclusion
  def self.included(base)
    #hacemos que la clase que incluye a este modulo, extienda el submodulo
    #ClassMethods que contiene los metodos de clase que se quieren agregar
    base.extend(ClassMethods)
  end

end

#test

class Person
  include Countable
  def say_hi
    puts 'HEYOOOO!!'
  end
  def say_thanks
    'GRACIELA'
  end
  def say_bye
    puts 'ADIOS, AMIGOS'
  end
  count_invocations_of(:say_hi)
  count_invocations_of(:say_bye)
end

person = Person.new
