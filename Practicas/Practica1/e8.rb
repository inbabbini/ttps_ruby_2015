[:upcase, :downcase, :capitalize, :swapcase]

#este es un arreglo de symbolos, los cuales casualmente tienen
#el mismo nombre que 4 metodos que la clase String implementa

[:upcase, :downcase, :capitalize, :swapcase].map do |method|
  "TTPS Opcion Ruby".send(method)
end

#al hacer un map sobre el arreglo, se itera sobre cada symbol,
#el cual luego es usado sobre como parametro en la funcion ::send()
#la cual ejecuta (si es valido) el parametro como si fuera un mensaje
#sobre el receptor, en este caso "TTPS Opcion Ruby", por lo tanto esto
#equivale a ejecutar los 4 metodos sobre el string, como

string = "TTPS Opcion Ruby"

string.upcase # => "TTPS OPCION RUBY"
string.downcase # => "ttps opcion ruby"
string.capitalize # => "Ttps opcion ruby"
string.swapcase # => "ttps oPCION rUBY"
