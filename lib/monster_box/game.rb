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
      first_player.game_started(self)
      second_player.game_started(self)
    end

    def end
      @state = :ended
    end

    def next_turn(player)
      if player == first_player && @state == :first_turn
        @state = :second_turn
      elsif player == second_player && @state == :second_turn
        @state = :first_turn
      else
        throw IllegalMove
      end
    end
  end
end
