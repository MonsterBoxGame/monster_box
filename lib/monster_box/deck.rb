module MonsterBox
  class Deck
    def initialize(cards)
      @cards = cards
    end

    def draw(number = 1)
      @cards.shift(number)
    end

    def insert(new_cards)
      rng = Random.new
      new_cards.each do |card|
        position = rng.rand(@cards.size)
        @cards.insert(position, card)
      end
    end

    def shuffle
      @cards.shuffle!
    end
  end
end
