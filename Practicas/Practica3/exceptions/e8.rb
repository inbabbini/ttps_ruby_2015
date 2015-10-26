def fun3
  puts "Entrando a fun3"
  raise RuntimeError, "Excepción intencional"
  puts "Terminando fun3"

rescue NoMethodError => e
  puts "Tratando excepción por falta de método"

rescue RuntimeError => e
  puts "Tratando excepción provocada en tiempo de ejecución"

rescue
  puts "Tratando una excepción cualquiera"

ensure
  puts "Ejecutando ensure de fun3"
end

def fun2(x)
  puts "Entrando a fun2"
  fun3
  a = 5 / x
  puts "Terminando fun2"
end

def fun1(x)
  puts "Entrando a fun1"
  fun2 x
rescue
  puts "Manejador de excepciones de fun1"
  raise
ensure
  puts "Ejecutando ensure de fun1"
end

begin
  x = 0
  begin
    fun1 x
  rescue Exception => e
    puts "Manejador de excepciones de Main"
    if x == 0
      puts "Corrección de x"
      x = 1
      retry
    end
  end
puts "Salida"
end

# 1 - Siguiendo el codigo
#
# Variables:
#
# 	x = 0
# 	a = 5/0 -> error
# 	x = 1
# 	a = 5/1 = 5
#
# Flujo de impresiones:
#
# 	Entrando a fun1
# 	Entrando a fun2
# 	Entrando a fun3
# 	Tratando excepcion rovocada en tiempo de ejecucion
# 	Ejecutando ensure de fun3
# 	manejador de excepciones de fun1
# 	ejecutando ensure de fun1
# 	manejador de excepciones de main
# 	correxion de x
#retry
# 	entrando a fun1
# 	entrando a fun2
# 	entrando a fun3
# 	Tratando excepcion rovocada en tiempo de ejecucion
# 	Ejecutando ensure de fun3
# 	terminando fun2
# 	ejecutando ensure de fun1
# 	salida

# 2 - Si se permutaran 'rescue RuntimeError' y 'rescue' se imprimiria
# 'tratando una excepcion cualquiera' ya que por defecto rescue levanta
# todas las exceptions StandardError y sus sublclases (como RuntimeError)

# 3 - retry es una palabra clave (solo permitida dentro del contexto
# de un rescue) la cual al ser ejecutada vuelve el control del script a
# comienzo del bloque begin .. end que se esta ejecutando en el momento
# Si se moviera la linea x = 0 dentro del segundo bloque begin .. end
# provocaria un loop infinito ya que se ejecutaria cada vez que se da el
# retry, anulando cada vez el arreglo hecho dentro del rescue
