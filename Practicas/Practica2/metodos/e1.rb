#Implementar metodo que reciba un arreglo con numeros y los ordene

def sort_numeric_array(narray)

  if narray.class != Array
    raise TypeError, 'Argument must be an array'
  end

  narray.each do |element|
    if (!element.kind_of?(Numeric))
      raise TypeError, 'Forbbiden elements on array, must be Numeric'
    end
  end

  narray.sort

end

# sort_numeric_array([14,6,2,3,0,10])
