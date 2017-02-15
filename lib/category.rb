class Category

  attr_reader :sell_in, :quality

  def initialize(sell_in, quality)
    @sell_in, @quality = sell_in, quality
  end

end
