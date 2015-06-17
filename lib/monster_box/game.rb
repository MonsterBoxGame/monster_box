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
      @state = :running
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
  end
end
