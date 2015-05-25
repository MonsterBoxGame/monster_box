module MonsterBox
  class Player
    attr_reader :crystal_bar

    def initialize(deck, hand)
      @deck = deck
      @hand = hand
      @crystal_bar = CrystalBar.initial
    end

    def game_started(game)
      @game = game
    end

    def pass_turn
      @game.next_turn(self)
    end
  end
end
