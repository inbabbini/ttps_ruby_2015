#encontrar los problemas con el siguiente codigo

# Tira un dado virtual de 6 caras

def tirar_dado
  rand 1..6
end

# Mueve la ficha de un jugador tantos casilleros como indique el dado en un
# tablero virtual de 40 posiciones.
# Si no se recibe la cantidad de casilleros, aprovecho el valor por defecto
# para ese parámetro para evitar tener que llamar a #tirar_dado
# dentro del cuerpo del método.

def mover_ficha(fichas, jugador, casilleros = tirar_dado)
  fichas[jugador] += casilleros
  if fichas[jugador] > 40
    puts "Ganó #{jugador}!!"
    true
  else
    puts "#{jugador} ahora está en el casillero #{fichas[jugador]}"
    fichas[jugador]
  end
end
# Cuerpo principal

posiciones = { azul: 0, rojo: 0, verde: 0 }
finalizado = false
until finalizado
  ['azul', 'rojo', 'verde'].shuffle.each do |jugador|
    finalizado = mover_ficha(posiciones, jugador)
  end
end

# Problema 1: el hash "posiciones" esta instanciado con Symbols, pero se
# lo quiere acceder con strings, lo cual va a devolver nil

# Problema 2: el metodo mover_ficha, en caso de salir por el "else", retornaria
# fichas[jugador], que en caso de q verdaderamente se accediera a tal dato,
# retornaria un dato numerico, no un false como se esperaria, por lo que
# se asignaria a 'finalizado' la cantidad de fichas de dicho jugador

# Problema? 3: se chequea por > 40, lo cual no se si esta bien si el tablero
# es de 40, creo q deberia ser >= 40

# Problema 4: se deberia chequear por finalizado dentro del .each, ya que
# si un jugador gana en la primer o segunda instancia del .each, el juego
# no finaliza ya que se ejecutan las iteraciones restantes
