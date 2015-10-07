#implementar un metodo que reciva opcionalmente un objeto TIME y retorne la
#cantidad de minutos que faltan desde este momento hasta el parametro pasado
#en caso de no tener parametro pasado se debe calcular hasta la medianoche

def cuanto_falta?(moment = Time.new(Time.now().year,Time.now().month,Time.now().day,23,59,59))

  ((moment - Time.new()) / 60).to_i

end
