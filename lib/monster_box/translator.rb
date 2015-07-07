module MonsterBox
  class Translator
    def initialize(game)
      @game = game
    end

    def execute(move)
      if move.action == :pass_turn
        @game.pass_turn(move.player_id)
      end
    end
  end
end
