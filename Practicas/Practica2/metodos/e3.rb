#teniendo este metodo

def sort_numeric_params(*nums)
  nums.sort
end

#y esta entrada

input = [15,16,14,3]

#para poder invocar el metodo sin que explote (ya que espera los numeros
#como parametros separados) deberia "explotar" el input al enviarlo por el
#parametro, es decir, separa el array en partes individuales

sort_numeric_params(input)
