#definir una funcion en la clase Array llamado randomly, que funcione de
# tal manera que si recive un bloque como parametro, debe invocar cada
# tal bloque con cada elemento del array, si no recive bloque debe devolver
# un enumerador que devuelva los elementos del array de a uno en orden
# aleatorio

class Array
  def randomly(rnd_max = 10)

    rndmz = Enumerator.new do |yielder|
      #mezclamos el array
      rndarr = self
      rand(rnd_max).times { rndarr = self.shuffle}
      rndarr.each do |elem|
        yielder.yield elem
      end
    end

    if block_given?
      rndmz.each do |elem|
        yield elem
      end
    else
      rndmz
    end

  end
end

rnd = [1,2,3,4,5,6].randomly
rnd.next

rnd2 = [1,2,3,4,5,6].randomly {| elem | elem * 2}
