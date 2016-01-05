module MonsterBox
  class Game
    attr_reader :first_player, :second_player

    def initialize(first_player, second_player)
      @first_player = first_player
      @second_player = second_player
      @players = [first_player, second_player]
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

    def finish
      @state = :ended
    end

    def pass_turn(player_id)
      player = find_player(player_id)
      player.pass_turn
    end

    def update(event)
      if event == Events::Game::PLAYER_DIED
        finish
      end
    end

    private

    def find_player(player_id)
      player = @players[player_id]
      raise MonsterBox::IllegalMove unless player
      player
    end
  end
end
