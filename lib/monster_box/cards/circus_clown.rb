module MonsterBox
  module Cards
    class CircusClown < Monster
      NAME = 'Circus Clown'
      COST = 1
      ATTACK = 1
      HEALTH = 3

      def initialize
        super(NAME, COST, ATTACK, HEALTH, true)
      end
    end
  end
end
