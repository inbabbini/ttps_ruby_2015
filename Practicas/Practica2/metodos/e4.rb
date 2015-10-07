#definir un metodo que tome n parametros de cualquier tipo y los convierta
#a string, imrimiendo la cantidad de caracteres y la representacion
#(de cada uno o del total?)

def stringify_params(*params)

  params.each do |object|
    print 'largo ', object.to_s.length, ' rep: '
    puts object.to_s
  end

end

stringify_params(['som',1],{mom: 2, fom: 'pep'},1)
