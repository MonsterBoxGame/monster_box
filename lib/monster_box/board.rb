module MonsterBox
  class Board
    attr_reader :minions

    def initialize
      @minions = []
    end

    def summon(minion_card)
      @minions.concat(minion_card.summon)
    end
  end
end
