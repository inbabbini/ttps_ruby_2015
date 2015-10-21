# Investigar sobre jerarquia de execepciones, particularmente para que
# se utiliza cada una de las clases

Exception
  # Clase padre de toda exception, define algunos metodos por defecto

StandardError < Exeption
  # Clase defecto para las clausulas 'rescue', los tipos de errores mas
  # comunes extienden de esta clase

IOError < StandardError < Exeption
  # Clase usada para clasificar errores que se dan a partir de fallas
  # en I/O, como leyendo/escribiendo archivos

NameError < StandardError < Exeption
  # Utilizado para manejar errores a partir de nombres dados, ya sea
  # porque no cumplen un cierto formato o porque no estan definidos

RuntimeError < StandardError < Exeption
  # Salta cuando se quiere llevar a cabo una operacion invalida, definida
  # pero invalida

NotImplementedError < ScriptError < Exeption
  # Extiende de ScriptError, salta cuando una funcion que se quizo llamar
  # desde el codigo no está soportada, ya sea por el SISTEMA OPERATIVO
  # o por el RUBY RUNTIME utilizado para ejecutar

StopIteration < IndexError < StandardError < Exeption
  # Utilizado para cortar iteraciones, Kernel#loop lo ataja por
  # defecto sin expotar, otros iteradores no (creo)

  loop do
    puts 'hello'
    raise StopIteration
    puts 'bye'
  end

  # => 'hello'

TypeError < StandardError < Exeption
  # Se utiliza y salta cuando se detecta un objeto de un tipo no esperado
  # para alguna accion o mensaje

SystemExit < Exeption
  # Levantado por Kernel#exit(status), el sistema lo utiliza para manejar
  # la finalizacion del script. Se puede trapear y asociar un status de
  # exito (true o false)
