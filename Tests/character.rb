class Character

  attr_accessor :name
  attr_accessor :base_class
  attr_accessor :race
  attr_accessor :max_health
  attr_accessor :armor_class
  attr_accessor :base_damage

  def initialize (pname, pbase_class, prace, pmax_health, parmor_class, pbase_damage)

    @name = pname
    @base_class = pbase_class
    @race = prace
    @max_health = pmax_health
    @armor_class = parmor_class
    @base_damage = pbase_damage

  end

  def dead?
    return max_health <= 0
  end

end

c = Character.new('Kurtz', 'Warrior', 'Orc', 20, 12, 5)
