module MonsterBox
  class GameBuilder
    def self.create_game
      first_player_cards = (1..30).map do
        MonsterBox::Cards::Circus::Ringmaster.new
      end
      second_player_cards = (1..30).map do
        MonsterBox::Cards::Circus::Ringmaster.new
      end
      first_crystal_bar = CrystalBar.initial
      second_crystal_bar = CrystalBar.initial
      first_player = Player.new(true,
                                Deck.new(first_player_cards),
                                first_crystal_bar)
      second_player = Player.new(false,
                                 Deck.new(second_player_cards),
                                 second_crystal_bar)

      first_player.add_observer(second_player)
      first_player.add_observer(first_player)
      second_player.add_observer(first_player)
      second_player.add_observer(second_player)
      game = Game.new(first_player, second_player, nil)
      first_player.add_observer(game)
      second_player.add_observer(game)
      game
    end
  end
end
