#definir una jerarquia de clases vehiculo: auto moto y lancha
# todos deben responder al metodo "arrancar" y necesitan una llave
# cada una redefine su metodo arrancar

class Vehiculo

  attr_accessor :key

  def initialize
    @key = false
  end

  def arrancar
    if self.key
      puts 'En marcha'
    else
      puts 'Falta la llave'
    end
  end

  def insert_key
    self.key = true
  end

  def take_key
    self.key = false
  end
end

class Auto < Vehiculo

  attr_accessor :gear, :handbrake

  def initialize
    super
    @gear = 0
    @handbrake = true
  end

  def arrancar
    if self.handbrake
      puts 'saca el freno bobo'
    elsif !self.dead_point?
      puts 'ponelo en punto muerto, salame'
    else
      super
    end
  end

  def dead_point?
    self.gear == 0
  end

end

class Moto < Vehiculo

  def initialize
    super
  end

  def arrancar
    if self.kick
      super
    end
  end

  def kick
    puts 'pateame y decime marta'
  end
end

class Lancha < Vehiculo

end


class Taller

  attr_accessor :jorge

  def initialize
    @jorge = true
  end

  def mechanic_available?
    return self.jorge
  end

  def probar(cosa)
    if self.mechanic_available?
      cosa.arrancar
    else
      puts 'Jorge no está'
    end
  end
end

# Deberia poder, siempre y cuando el objeto motosierra responda al mensaje
# "arrancar". Esto es usar polimorfismo, es decir, diferentes objetos/clases
# respondiendo al mismo mensaje de alguna manera en particular
