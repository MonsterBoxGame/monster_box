module MonsterBox
  class Deck
    attr_reader :cards, :overdraw

    def initialize(cards)
      @cards = cards
      @overdraw = 0
    end

    def draw(number = 1)
      cards = @cards.shift(number)
      @overdraw += 1 if cards.empty?
      cards
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
