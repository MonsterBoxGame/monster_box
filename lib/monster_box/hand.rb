module MonsterBox
  class Hand
    MAX_CARDS = 10

    def initialize(cards)
      @cards = cards
    end

    def insert(cards)
      @cards.concat(cards)
      @cards = @cards.take(MAX_CARDS)
    end
  end
end
