#implementar metodo que reciva n parametros numericos y devuelva un array ordenado

#usando el '*' antes del nombre del parametro, definimos que todos los parametros
# que se le mande a esa funcion (sin contar a los otros definidos) sean metidos en un array
# creo que se le dice splat

def sort_numeric_params(*nums)

  if nums.empty?
    raise ArgumentError, 'No arguments given'
  end

  nums.each do |element|
    if (!element.kind_of?(Numeric))
      raise TypeError, 'Forbbiden elements given, parameters must numeric'
    end
  end

  nums.sort

end

# sort_numeric_params(3,2,1,5,2,1)
