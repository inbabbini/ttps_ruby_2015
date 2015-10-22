module Countable

  #metodos que terminaran siendo parte de la clase
  module ClassMethods

    def count_invocations_of(sym)

      #definimos el accessor a la variable de instancia @method_calls
      if !self.method_defined?(:method_calls)
        define_method(:method_calls) do
          @method_calls ||= Hash.new(0)
        end
      end

      #renombramos el metodo de instancia a trackear
      alias_method ('old' + sym.to_s).to_sym, sym

      #agregamos el metodo que acabamos de renombrar
      define_method(sym) do
        @method_calls[sym]+= 1
        self.send(('old' + sym.to_s).to_sym)
      end

    end

  end

  #metodos de instancia

  def invoked?(sym)
    if !method_calls.has_key?(sym)
      raise RuntimeError, 'Non tracked method requested'
    end
    self.method_calls[sym]  > 0
  end

  def invoked_times(sym)
    if !method_calls.has_key?(sym)
      raise RuntimeError, 'Non tracked method requested'
    end
    self.method_calls[sym]
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
