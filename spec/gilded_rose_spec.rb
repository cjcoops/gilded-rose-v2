require 'gilded_rose'

describe GildedRose do

  describe "normal item" do

    it "reduces quality by 1" do
      items = [Item.new("normal", 10, 10)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq 9
    end

    it "reduces sellin by 1" do
      items = [Item.new("normal", 10, 10)]
      GildedRose.new(items).update_quality()
      expect(items[0].sell_in).to eq 9
    end

    it "reduces quality by 2 after sellin reaches 0" do
      items = [Item.new("normal", 0, 10)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq 8
    end

    it "quality can not go below zero" do
      items = [Item.new("normal", 10, 0)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq 0
    end

  end

  describe "aged brie" do

    it "increases quality by 1" do
      items = [Item.new("Aged Brie", 10, 10)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq 11
    end
    #
    it "increases quality by 2 if sellin 0 or less" do
      items = [Item.new("Aged Brie", 0, 10)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq 12
    end

    it "reduces sellin by 1" do
      items = [Item.new("Aged Brie", 10, 10)]
      GildedRose.new(items).update_quality()
      expect(items[0].sell_in).to eq 9
    end

    it "quality can not go above 50" do
      items = [Item.new("Aged Brie", 10, 50)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq 50
    end

  end

  describe "sulfuras" do

    it "quality does not change" do
      items = [Item.new("Sulfuras, Hand of Ragnaros", 10, 80)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq 80
    end

    it "sellin does not change" do
      items = [Item.new("Sulfuras, Hand of Ragnaros", 10, 80)]
      GildedRose.new(items).update_quality()
      expect(items[0].sell_in).to eq 10
    end

  end

  describe "backstage passes" do

    it "reduces sellin by 1" do
      items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 10, 10)]
      GildedRose.new(items).update_quality()
      expect(items[0].sell_in).to eq 9
    end

    it "quality drops to 0 after the concert" do
      items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 0, 10)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq 0
    end

    context "sellin is over 10" do
      it "quality increases by 1" do
        items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 11, 10)]
        GildedRose.new(items).update_quality()
        expect(items[0].quality).to eq 11
      end

      it "quality can not go above 50" do
        items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 11, 50)]
        GildedRose.new(items).update_quality()
        expect(items[0].quality).to eq 50
      end
    end

    context "sellin is 10 or less and greater than 5" do
      it "quality increases by 2 once sellin reaches 10" do
        items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 10, 10)]
        GildedRose.new(items).update_quality()
        expect(items[0].quality).to eq 12
      end

    end

    context "sellin is 5 or less and greater than 0" do
      it "quality increases by 3 once sellin reaches 5" do
        items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 5, 10)]
        GildedRose.new(items).update_quality()
        expect(items[0].quality).to eq 13
      end

    end

  end

end
