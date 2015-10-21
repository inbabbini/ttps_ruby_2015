#funcion que retorna la hora pasada a palabras
#siendo t = Time.new
#t.min = minuto actual
#t.hour = hora
#t.mday = dia

def gimme_time(time = Time.now)

  case
  when time.min.between?(0,10)
      return "Son las " + time.hour.to_s + " en punto"
    when time.min.between?(11,20)
      return "Son las " + time.hour.to_s + " y cuarto"
    when time.min.between?(21,34)
      return "Son las " + time.hour.to_s + " y media"
    when time.min.between?(35,44)
      return "Son las " + (time.hour + 1).to_s + " menos veinticinco"
    when time.min.between?(45,55)
      return "Son las " + (time.hour + 1).to_s + " menos cuarto"
    when time.min.between?(56,59)
      return "Son casi las " + (time.hour + 1).to_s
    else
      return "al carajo"
  end

end
