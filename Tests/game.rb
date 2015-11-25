require_relative 'dice.rb'
require_relative 'character.rb'

pc = Character.new('Kurtz', 'Warrior', 'Orc', 20, 14, 8)
enemy = Character.new('Gray Wolf', 'Beast', 'Wolf', 10, 10, 4)

d20 = Dice.new(20)
d4 =  Dice.new(4)

until pc.dead? || enemy.dead?
  #pc turn
  d20res = d20.roll
  puts pc.name + ' rolls a ' + d20res
  if(d20res >= enemy.armor_class)
    puts pc.name + ' hits for ' + pc.base_damage + ' damage'
    enemy.max_health-= pc.base_damage
  else
    puts pc.name + ' misses'
  end

  #enemy turn
  d20res = d20.roll
  puts enemy.name + ' rolls a ' + d20res
  if(d20res >= pc.armor_class)
    puts enemy.name + ' hits for ' + enemy.base_damage + ' damage'
    pc.max_health-= enemy.base_damage
  else
    puts enemy.name + ' misses'
  end
end

if enemy.dead?
  puts pc.name + ' wins'
else
  puts enemy.name + ' wins'
end
