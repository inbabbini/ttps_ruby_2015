#Duda: que onda con el objetivo del ejercicio

class GenericFactory

  def self.create(**args)
    new(**args)
  end

  def initialize(**args)
    raise NotImplementedError
  end

end

class Bomb < GenericFactory

  @properites

  def [](prop_sym)
    if prop_sym
      @properties[prop_sym]
    else
      @properites ||= Hash.new
    end
  end

  def []=(prop_sym, value)
    @properties[prop_sym]= value
  end

  def initialize(**args)
    @properties = Hash.new
    args.each do |propertie, value|
      self[propertie]= value
    end
  end

end
