def opcion_1
  a = [1, nil, 3, nil, 5, nil, 7, nil, 9, nil]
  b = 3
  c = a.map do |x|
    x * b
  end
  puts c.inspect
rescue
  0
end

# opcion_1 explota al querer hacer nil * 3, es rescatado en el rescue
# que hace retornar 0 la funcion


def opcion_2
  c = begin
    a = [1, nil, 3, nil, 5, nil, 7, nil, 9, nil]
    b = 3
    a.map do |x|
      x * b
    end
    rescue
      0
    end
  puts c.inspect
end

# opcion_2 retorna nil e imprime '0', ya que ejecuta el puts c.inspect,
# c previamente toma el valor retornado del bloque begin .. end, que al
# explotar es rescatado y retorna 0


def opcion_3
  begin
  a = [1, nil, 3, nil, 5, nil, 7, nil, 9, nil]
  b = 3
  c = a.map { |x| x * b } rescue 0
  puts c.inspect
  end
end

# opcion_3 retorna nil e imprime 0, por algun motivo poner el rescue ahi
# hace que si explota la linea se devuelve 0
# nota: preguntar que onda

def opcion_4
  a = [1, nil, 3, nil, 5, nil, 7, nil, 9, nil]
  b = 3
  c = a.map { |x| x * b rescue 0 }
  puts c.inspect
end

# opcion_4 deveria, por intuicion, devolver [3,0,9,0,15,0,21,0,27,0]
# ya que si explota cada iteracion del map devolveria 0
