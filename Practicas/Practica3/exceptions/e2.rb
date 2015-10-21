# Kernel::raise se utiliza para lanzar exceptions. Por defecto, si se
# la llama sin parametros:

  raise
  raise == raise $!
  if $! == nil then raise == raise RuntimeError
    # => lanza la exception referenciada por la variable global $!
    # => si $! = nil, lanza un RuntimeError

# Kernel::raise, si se le pasa un string como parametro, lanza un
# RuntimeError con un mensaje igual al string pasado

  raise 'La cagaste maestro'
  # => RuntimeError: la cagaste maestro

# Kernel::raise tambien puede utilizarse para lanzar cualquier tipo de
# Exception si se le envia alguna de sus subclases como parametro.
# Opcionalmente se le puede enviar un string para pasar un mensaje

  raise NameError, 'Le pifiaste de nombre, capo'
  # => NameError: le pifiaste de nombre, capo

# Kernel::raise va de la mano con Kernel::rescue, utilizado para atajar
# las exceptions levantadas por los raise

  begin
    puts 'Hello'
    raise RuntimeError
    puts 'World'
  rescue RuntimeError
    puts 'RuntimeError atajado'
  end

  # => 'Hello'
  #    'RuntimeError atajado'

#===================================================================

# Kernel::throw(tag,obj) esta muy atado a Kernel::catch(tag). Una clausula
# catch se suele utilizar dentro del contexto de ejecucion de un bloque
# de una clausula catch. Si se ejecuta el throw(tag,obj), RUBY busca
# en la pila de ejecucion la sentencia catch mas cercana que tenga el mismo
# tag que se paso como parametro a la clausula throw. De no ser atrapado
# por ningun catch, lanza un error UncaughtThrowError

  catch(:tag1) do
    catch(:tag2) do
      throw(:tag1,'tag1')
      puts 'Hello'
    end
    puts 'World'
  end
# => no imprime nada, retorna 'tag1'

  catch(:tag1) do
   catch(:tag2) do
     puts 'Hello'
     throw(:tag1,'tag1')
   end
   puts 'World'
  end
# => imprime 'Hello', retorna 'tag1'

  catch(:tag1) do
   catch(:tag2) do
     puts 'Hello'
     throw(:tag2,'tag2')
   end
   puts 'World'
  end
# => imprime 'Hello' 'World', retorna 'nil'*
# *retorna nil xq catch, de no contener o ejecutar un throw que matchee
# su tag, retorna lo que retorna la ultima linea ejecutada, en este caso
# la ejecucion de puts que devuelve nil
