class Submarine

  attr_reader :depth, :tile, :total_revenue
  attr_accessor :cargo

  def initialize
    @depth = Ocean::SURFACE
    @tile = 0
    @cargo = []
    @total_revenue = 0
  end

  def dive!
    if @depth == Ocean::SURFACE
      @depth -= 500
    end
  end

  def surface
    if @depth >= Ocean::SURFACE - 500
      @depth += 500
    end
  end

  def descend
    if @depth <= (Ocean::SURFACE - 500) && @depth > (Ocean::MAX_DEPTH)
      @depth -= 500
    end
  end

  def ascend
    @depth += 500 unless @depth >= (Ocean::SURFACE - 500)
  end

  def forward
    @tile += 1 unless @tile >= Ocean::MAX_TILE
  end

  def backward
    @tile -= 1 unless @tile <= Ocean::MIN_TILE
  end

  def sushiable_fishes
    # do not mutate array while iterating the array
    sushiable_fishs = cargo.select do |fish|
      fish.sushiable?
    end
    sushiable_fishs.length
  end

  def fish
    if @depth < Ocean::SURFACE 
      fishes = Ocean.fish(depth, tile)
      @cargo << fishes
    end
  end

  def sell_cargo
    if @depth == Ocean::SURFACE
      cargo.delete_if do |fish|
        @total_revenue += fish.value
      end
      return true
    else
      false
    end
  end



end


