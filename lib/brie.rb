class Brie

  attr_reader :sell_in, :quality

  def initialize(sell_in, quality)
    @sell_in, @quality = sell_in, quality
  end

  def update_quality
    @sell_in -= 1
    return if quality >= 50
    @quality += 1
    @quality += 1 if sell_in <= 0
  end

end
