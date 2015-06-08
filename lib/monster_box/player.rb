module MonsterBox
  class Player
    STARTING_HEALTH = 50

    attr_reader :deck, :crystal_bar, :hand, :board, :health

    def initialize(deck)
      @deck = deck
      @board = MonsterBox::Board.new
      @crystal_bar = CrystalBar.initial
      @health = STARTING_HEALTH
    end

    def game_started(game, hand)
      @game = game
      @hand = hand
    end

    def pass_turn
      @game.next_turn(self)
    end

    def play_card(card)
      if can_play?(card)
        @hand.play_card(card)
        @board.summon(card)
      else
        raise MonsterBox::IllegalMove
      end
    end

    def being_attacked(attacker)
      @health -= attacker.attack
    end

    private

    def can_play?(card)
      @crystal_bar.enough_crystals?(card.cost)
    end
  end
end
