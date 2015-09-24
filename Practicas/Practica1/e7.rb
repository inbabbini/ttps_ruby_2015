#utilizando lo provisto por String

#imprimir string con un sus caracters invertidos

  puts "alpaca".reverse # => 'acapla'

#imprimir cada caracter del string como su codigo ASCII

  puts "alpaca".each_byte { |byte| print byte, ' '} # => 97 108 112 97 99 97

#eliminar los espacios en blanco de un string

  puts "al pa ca".tr(" ", '')

#cambiando las vocales por numeros

  puts "alpaca".gsub(/[aeiou]/, 'a' => '4', 'e' => '3', 'i' => '1', 'o' => '0', 'u' => '6')
