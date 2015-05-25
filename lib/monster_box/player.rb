module MonsterBox
  class Player
    attr_reader :deck, :crystal_bar, :hand

    def initialize(deck)
      @deck = deck
      @crystal_bar = CrystalBar.initial
    end

    def game_started(game, hand)
      @game = game
      @hand = hand
    end

    def pass_turn
      @game.next_turn(self)
    end
  end
end
