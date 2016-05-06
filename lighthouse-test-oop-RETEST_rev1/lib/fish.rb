class Fish

  attr_reader :weight, :value

  def initialize(weight, value)
    @weight = weight
    @value = value
  end

  def sushiable?
    (self.class == GiantSalmon) || (self.class == GiantTuna)
  end

  def value_per_kg
    (value.to_f/weight)
  end


end