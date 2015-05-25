module MonsterBox
  class GameBuilder
    def self.create_game
      first_player = Player.new(nil, nil)
      second_player = Player.new(nil, nil)
      Game.new(first_player, second_player, nil)
    end
  end
end
