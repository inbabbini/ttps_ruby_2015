# Implementar un metodo que reciba un Hash y un Proc, el cual debe retornar
# un nuevo Hash donde las CLAVES sean los VALORES del Hash original,
# y cuyos VALORES sean los resultados de pasar las CLAVES originales por la
# funcion (proc) pasado. Este proc debe recivir un parametro

def rehash_with(old_hash, inproc)

  new_hash = Hash.new
  #por cada par key - value
  old_hash.each do | key, value |
    #transformar y agregar al nuevo hash
    new_hash[value] = inproc.call(key)
  end
  #retornar
  new_hash
end


#testing

hsh = { :key => 'value', 'otherkey' => 1}

rehash_with( hsh, ->(x){x.to_s.upcase} )
