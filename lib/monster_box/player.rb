module MonsterBox
  class Player
    def initialize(deck, hand)
      @deck = deck
      @hand = hand
    end

    def game_started(game)
      @game = game
    end

    def pass_turn
      @game.next_turn(self)
    end
  end
end
