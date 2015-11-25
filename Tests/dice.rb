class Dice

  attr_accessor :faces

  def initialize (sides)
    @faces = sides
  end

  def roll
    return Random::rand(faces) + 1
  end

end


d20 = Dice.new(20)

results = Hash.new(0)
acc = 0
result = 0

(1..10).each do |index|
  results[result = d20.roll] += 1
  acc += result
end

results.sort.each {|k,v| puts k.to_s + ' => ' + v.to_s}

puts acc / 10
