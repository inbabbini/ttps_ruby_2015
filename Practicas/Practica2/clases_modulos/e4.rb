module Countable

  @methodsCalls = Hash.new

  #metodo que será invocado cuando Countable es incluido, deberia
  #inicializar un contador para cada metodo, y redefinir cada metodo
  #de la clase a la que se incluye
  def included

    self.methods.each do |method|
      #inicializa en 0 las llamadas en el hash
      @methodsCalls[method] = 0
      #renombramos todos los methods
      alias_method ('old' + method.to_s).to_sym, method
      #agregamos los methods que acabamos de renombrar
      self.class.define_method(method){@methodsCalls[method]+=1; self.send(('old' + method.to_s).to_sym)}
    end
  end

  def count_invocations_of(sym)
    #no cabe en este diseño, podria ser
    @methodsCalls[sym]= 0
  end

  def invoked?(sym)
    @methodsCalls[sym] > 0
  end

  def invoked_times(sym)
    @methodsCalls[sym]
  end

end
