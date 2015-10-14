# Implementar un metodo que reciva N parametros y un bloque, ejecute al
# bloque enviandole los N parametros y, dependiendo de lo que suceda,
# imprima y retorne:
#   :ok => si la ejecucion fue exitosa
#   'Algo salio mal...' + :rt => si se produjo un RuntimeException
#   'No encontre un metodo: exeptionMessage' + :nm => si se produjo un NoMethdodError
#   'No se que hacer!' + Relanzar execption => cualquier otra exepcion

def secure_exec(*params,&block)

  #ejecutar bloque
  block.call(*params)

rescue RuntimeError
  puts 'Algo salio mal...'
  return :rt

rescue NoMethodError => error
  puts 'No encontre un metodo: ' + error.message
  return :nm

#si explota por otra cosa
rescue StandardError
  puts 'No se que hacer!'
  raise

#si no explotó
else
  return :ok

end

#testeando

secure_exec(1){|x| [1,2,3].freeze << x} #=> :rt
secure_exec(1){|x| x.cualquiercosa } #=> :nm
secure_exec(1){|x,y| x + y} #=> 'No se que hacer!' + Exeption
secure_exec(1,2){|x,y| x + y} #=> :ok
