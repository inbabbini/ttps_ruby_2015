#definir un metodo que tome n parametros de cualquier tipo y los convierta
#a string, imrimiendo la cantidad de caracteres y la representacion
#(de cada uno o del total?)

def stringify_params(*params)

  if params.size < 1
    raise ArgumentError, 'No argumnets given'
  end

  params.each do |object|
    puts object.to_s + ' --> ' + object.to_s.length.to_s
  end
  nil
end

# stringify_params(['som',1],{mom: 2, fom: 'pep'},1)
