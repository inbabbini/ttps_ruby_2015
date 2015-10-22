#  Method #expansor(string)

def expansor(string)

  if string.class != String
    raise StandardError, "La entrada no es un string"
  end

  if string.size < 1
    raise StandardError, "El string es vacío"
  end

  abc = ('a'..'z').to_a

  string.chars.map do |char|
    if abc.index(char.downcase) == nil
      raise StandardError, "El formato del string es incorrecto"
    end
    char.rjust(abc.index(char.downcase)+1, char)
  end
  .join()

end
