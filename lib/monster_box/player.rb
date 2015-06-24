module MonsterBox
  class Player
    include Observable

    STARTING_HEALTH = 50

    attr_reader :is_turn, :deck, :crystal_bar, :hand, :board, :health

    def initialize(my_turn, deck, crystal_bar)
      @is_turn = my_turn
      @deck = deck
      @board = MonsterBox::Board.new
      @crystal_bar = crystal_bar
      @health = STARTING_HEALTH
    end

    def game_started(game, hand)
      @game = game
      @hand = hand
    end

    def pass_turn
      if @is_turn
        changed
        notify_observers(Events::TURN_PASSED)
      else
        throw IllegalMove
      end
    end

    def play_card(card)
      if can_play?(card)
        @hand.play_card(card)
        @board.summon(card)
      else
        raise MonsterBox::IllegalMove
      end
    end

    def attack_target(opponent, attacker, target)
      opponent.under_attack(@board, attacker, target)
    end

    def under_attack(opponent_board, attacker, target)
      if target == self
        being_attacked(attacker)
      else
        opponent_board.attack_monster(@board, attacker, target)
      end
    end

    def being_attacked(attacker)
      @health -= attacker.attack
      unless alive?
        changed
        notify_observers(Events::PLAYER_DIED)
      end
    end

    def alive?
      @health > 0
    end

    def update(event)
      if event == Events::TURN_PASSED
        if @is_turn
          @is_turn = false
        else
          @is_turn = true
          @crystal_bar.next_turn
          new_card = @deck.draw
          @hand.insert(new_card)
          @board.next_turn
        end
      end
    end

    private

    def can_play?(card)
      @crystal_bar.enough_crystals?(card.cost)
    end
  end
end
