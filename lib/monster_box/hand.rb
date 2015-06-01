module MonsterBox
  class Hand
    MAX_CARDS = 10

    attr_reader :cards

    def initialize(cards)
      @cards = cards
    end

    def insert(cards)
      @cards.concat(cards)
      @cards = @cards.take(MAX_CARDS)
    end

    def play_card(id)
      card = find(id)
      @cards.delete(card)
      card
    end

    def find(id)
      card = @cards.find do |card|
        card.object_id == id
      end
      raise unless card
      card
    end
  end
end
