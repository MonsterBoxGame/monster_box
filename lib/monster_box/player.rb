module MonsterBox
  class Player
    include Observable

    STARTING_HEALTH = 50
    ABILITY_COST = 3

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
        notify_observers(Events::Game::TURN_PASSED)
      else
        throw MonsterBox::IllegalMove
      end
    end

    def play_card(card)
      if can_play?(card)
        @crystal_bar.spend(card.cost)
        @hand.play_card(card)
        if card.is_monster?
          @board.summon(card)
        else
          card.play(self)
        end
      else
        raise MonsterBox::IllegalMove
      end
    end

    def attack_target(opponent, attacker, target)
      opponent.being_attacked(@board, attacker, target)
    end

    def being_attacked(opponent_board, attacker, target)
      if @board.has_guards?
        if @board.has_guard?(target)
          opponent_board.attack_monster(@board, attacker, target)
        else
          raise MonsterBox::IllegalMove.new(MonsterBox::IllegalMove::GUARD_ERROR)
        end
      else
        if target == self
          take_damage(attacker.attack)
        else
          opponent_board.attack_monster(@board, attacker, target)
        end
      end
    end

    def alive?
      @health > 0
    end

    def use_ability
      if can_ability?
        @crystal_bar.spend(ABILITY_COST)
        @used_villain_ability = true
        draw_card
      else
        raise MonsterBox::IllegalMove
      end
    end

    def update(event)
      if event == Events::Game::TURN_PASSED
        if @is_turn
          @is_turn = false
        else
          draw_card
          @is_turn = true
          @used_villain_ability = false
          @crystal_bar.next_turn
          @board.next_turn
        end
      end
    end

    private

    def can_play?(card)
      @crystal_bar.enough_crystals?(card.cost)
    end

    def can_ability?
      !@used_villain_ability &&
        @crystal_bar.enough_crystals?(ABILITY_COST)
    end

    def take_damage(amount)
      @health -= amount
      unless alive?
        changed
        notify_observers(Events::Game::PLAYER_DIED)
      end
    end

    def draw_card
      new_cards = @deck.draw
      unless new_cards.empty?
        @hand.insert(new_cards)
      else
        drain
      end
    end

    def drain
      take_damage(deck.overdraw)
    end
  end
end
