# begin .. end
# begin y end delimitan bloques de ejecucion, begin a veces es implicito
# dependiendo del contexto, como en la definicion de metodos de alguna clase

begin
  #block
end

class Test
  def method
    #block
  end
end

# rescue
# dentro de los bloques begin .. end  pueden saltar exceptions por varios
# motivos, y puede ser necesario o conveniente atrapar esas exceptions
# para llevar a cabo determinadas tareas a partir de saber que se dio tal
# o cual exception en particular

begin

  # dangerous code

rescue NotImplementedError
  puts 'Catch just NotImplementedError exceptions'

rescue
  puts 'Catch StandardError and its subclasses exceptions'

rescue Exeption
  puts 'Catch em all!'

end

# else
# dentro de un bloque begin .. end, la clausula else sirve para
# encapsular un cierto codigo que se quiere ejecutar si no se dio
# ninguna exception

begin

  # dangerous code

rescue Exception
  puts 'Catched!'

else
  puts 'All good'

end

# ensure
# asi como else sirve para ejecutar un cierto codigo en caso de que
# no haber exceptions, ensure asegura la ejecucion de cierto codigo
# siempre, incluso cuando haya alguna exception

begin

  # dangerous code

rescue Exception
  puts 'Catched!'
ensure
  puts 'I run EVRYTIEM'
end
