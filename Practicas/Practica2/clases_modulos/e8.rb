#analizar el script
#dudas: que onda? como se supone q hay q interpretar esto?

#1)
puts A.value
  # => si A es una clase, imprime el valor retornado por .value (classMethod)
  # => si A es una constante, y dicha constante puede responder al mensaje .value
  # imprime el valor retornado por la constante en A al enviarle .value
puts A::B.value
puts C::D.value
puts C::E.value
puts F.value

#2)
puts A::value
puts A.new.value
puts B.value
puts D.value
puts C.value

#Conclusion, todo depende demasiado de como este hecho

#EJ 1

module A

  module B

    def self.value
      puts 'valor B'
    end

  end

  def self.value
    puts 'valor A'
  end

end

# EJ 2

class Valuable

  attr_accessor :value

  def initialize(value)
    self.value = value
  end

end

module A

  B = Valuable.new('valor B')

  def self.value
    puts 'valor A'
  end

end

# EJ 3

module A

  B = Valuable.new('valor B')

  def self.value
    puts 'valor A'
  end

end
