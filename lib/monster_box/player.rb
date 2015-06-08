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

    def play_card(id)
      if can_play?(id)
        monster = @hand.play_card(id)
        @board.summon(monster)
      else
        raise MonsterBox::IllegalMove
      end
    end

    def being_attacked(attacker)
      @health -= attacker.attack
    end

    private

    def can_play?(id)
      @crystal_bar.enough_crystals?(@hand.find(id).cost)
    end
  end
end
