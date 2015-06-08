module MonsterBox
  class Board
    attr_reader :monsters

    def initialize
      @monsters = []
    end

    def summon(monster_card)
      @monsters.concat(monster_card.summon)
    end
  end
end
