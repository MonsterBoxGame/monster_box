module MonsterBox
  class Game
    attr_reader :first_player, :second_player

    def initialize(first_player, second_player, board)
      @first_player = first_player
      @second_player = second_player
      @board = board
      @state = :new
    end

    def start
      @state = :first_turn
      first_player.deck.shuffle
      first_hand = Hand.new(first_player.deck.draw(3))
      first_player.game_started(self, first_hand)
      second_player.deck.shuffle
      second_hand = Hand.new(second_player.deck.draw(3))
      second_player.game_started(self, second_hand)
    end

    def end
      @state = :ended
    end

    def next_turn(player)
      if player == first_player && @state == :first_turn
        @state = :second_turn
        next_turn_for_player(second_player)
      elsif player == second_player && @state == :second_turn
        @state = :first_turn
        next_turn_for_player(first_player)
      else
        throw IllegalMove
      end
    end

    def next_turn_for_player(player)
      player.crystal_bar.next_turn
      new_card = player.deck.draw
      player.hand.insert(new_card)
    end
  end
end
