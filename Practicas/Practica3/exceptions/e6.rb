# Este script lee una secuencia de no menos de 15 números desde teclado y
# luego imprime el resultado de la división de cada número por su entero
# inmediato anterior.
# Como primer paso se pide al usuario que indique la cantidad de números
# que ingresará.
begin
  cantidad = 0
  begin
    while cantidad < 15
      puts '¿Cuál es la cantidad de números que ingresará? Debe ser al menos 15'
      input = gets
      puts input
      puts input.class
      # if input.class != Fixnum
      #   raise TypeError
      # end
      cantidad = input.to_i
    end

  rescue TypeError
    puts 'Hubo un error con el dato ingresado, por favor ingrese un numero válido'
    retry
  end

  # Luego se almacenan los números
  numeros = 1.upto(cantidad).map do
    begin
      puts 'Ingrese un número entero'
      input = gets
      # if input.class != Fixnum
      #   raise TypeError
      # end
      input.to_i
    rescue TypeError
      puts 'Hubo un error con el dato ingresado, por favor ingrese un numero válido'
      retry
    end
  end
  # Y finalmente se imprime cada número dividido por su número entero
  # inmediato anterior
  resultado = numeros.map { |x| x / (x - 1) rescue 'undefined' }
  puts 'El resultado es: %s' % resultado.join(', ')
end
