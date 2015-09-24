#Instanciaciones

#Array

  #instanciacion literal
  array1 = [1,2,3] # => [1,2,3]

  #instanciacion con constructor
  array2 = Array.new() # => []
  array3 = Array.new(3) # => [nil,nil,nil]
  array4 = Array.new(3,1) # => [1,1,1]  OJO!: todas las pociciones apuntan a la misma instancia
  array5 = Array.new(3) {Array.new(2)} # => [[nil,nil],[nil,nil],[nil,nil]] pasarle un bloque con un objeto instancia cada posicion con un objeto asi


#Hash (collecion de claves unicas y sus respectivos valores)

    #instanciacion literal
    hash1 = {'key' => 'value', 'key2' => 'value2'}
    hash2 = {:key => 'value', :key2 => 'value2'}
    #en caso de usar Symbols como keys, caso especial
    symbol_hash = { key: 'value'}

    #instanciacion con constructor

    hash3 = Hash.new; # => {} => hash3[key] => nil
    #un hash devuelve un valor default cuando se accede a una key inexistente,
    #por default es nil, se puede cambiar tanto en el constructor:
    hash4 = Hash.new('naranja') # => {} => hash4[key] => 'naranja'
    #como usando el metodo ::default=
    hash4.default = 'naranja por aca' # => {} => hash4[key] => 'naranja por aca'


#String

  #instanciacion literal

  string1 = 'sarasa' # => 'sarasa'

  #instanciacion por constructor

  string2 = String.new('saraka') # => 'saraka' OJO: copia la entrada
  string3 = String.new(string2) # => 'saraka' OJO: retorna una copia


#Symbol

  #instanciacion literal
  sym1 = :symbol_name # => :symbol_name
  sym2 = :'symbol_2_name' # => :symbol_2_name

  #instancacion por constructor
  #Symbol no tiene un constructor per-se pero se pueden generar symbols
  #usando los metodos ::to_sym de diferentes clases, por ejemplo

  sym3 = 'alto_symbol_papa'.to_sym() # => :alto_symbol_papa
