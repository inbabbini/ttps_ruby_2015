#funcion que retorna la hora pasada a palabras
#siendo t = Time.new
#t.min = minuto actual
#t.hour = hora
#t.mday = dia

def gimme_time(time)

  if time.min < 56
    print "Son las " #print es como el puts pero sin un new line
  end
  case
  when time.min.between?(0,10)
      puts time.hour.to_s + " en punto"
    when time.min.between?(11,20)
      puts time.hour.to_s + " y cuarto"
    when time.min.between?(21,34)
      puts time.hour.to_s + " y media"
    when time.min.between?(35,44)
      puts time.hour.to_i()+1.to_s + " menos veinticinco"
    when time.min.between?(45,55)
      puts time.hour.to_i()+1.to_s + " menos cuarto"
    when time.min.between?(56,59)
      puts "Son casi las " + time.hour.to_i()+1.to_s
    else
      puts "al carajo"
  end

end
