module MonsterBox
  class GameBuilder
    def self.create_game
      first_player = Player.new(Deck.new((1..30).to_a))
      second_player = Player.new(Deck.new((1..30).to_a))
      Game.new(first_player, second_player, nil)
    end
  end
end
