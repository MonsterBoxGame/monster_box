module MonsterBox
  class Move
    attr_reader :player_id, :action

    def initialize(player_id, action)
      @player_id = player_id
      @action = action
    end
  end
end
