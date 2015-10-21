# retry
# retry sirve para, justamente, volver a ejecutar el bloque en el cual
# se encuentra, desde la sentencia begin (es decir, desde el principio)

begin

  #dangerous code

rescue Exception
  puts 'Something broke'
  #do something to fix problems
  retry
end

# Ejemplo boludo:

num = 0
begin

  if num == 5
    'ok'
  else
    raise RuntimeError
  end

rescue RuntimeError
  puts 'catched!'
  num += 1
  retry

end
