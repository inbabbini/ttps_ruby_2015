#Manejo de clases y metodos

#Creando una clase nueva

class New_Class

  @instance_var
  @@class_var

  def initialize
    @instance_var = nil
    @@class_var = nil
  end

  def self.class_method
    puts 'this is class_method'
  end

  def method1
    puts 'this is method 1'
  end

  def method2
    puts 'this is method 2'
  end

  def instance_var
    return @instance_var
  end

  def instance_var=(input)
    @instance_var = input
  end

end


New_Class.methods
#este metodo retorna un array con los Symbols correspondientes
#a los nombres de los metodos de clase de la clase y de todas sus superclases

New_Class.instance_methods
#Este metodo retorna un array con los Symboles que corresponden
#a los nombre de los metodos de la clase y los heredados

New_Class.ancestors
#este metodo retorna un array con las Clases que son superclase
#de New_Class y los modulos que New_Class tiene incluidos

New_Class.included_modules
#este metodo retorna un array con los modulos que la clase incluye

New_Class.instance_variables
#este metodo deberia retornar

New_Class.class_variables
