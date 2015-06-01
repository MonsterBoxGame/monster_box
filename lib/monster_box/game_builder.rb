module MonsterBox
  class GameBuilder
    def self.create_game
      first_player_cards = (1..30).map do
        MonsterBox::Cards::OfficerZombie.new
      end
      second_player_cards = (1..30).map do
        MonsterBox::Cards::OfficerZombie.new
      end
      first_player = Player.new(Deck.new(first_player_cards))
      second_player = Player.new(Deck.new(second_player_cards))
      Game.new(first_player, second_player, nil)
    end
  end
end
