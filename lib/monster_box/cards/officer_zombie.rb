module MonsterBox
  module Cards
    class OfficerZombie < Monster
      NAME = 'Officer Zombie'
      COST = 2
      ATTACK = 2
      HEALTH = 3

      def initialize
        super(NAME, COST, ATTACK, HEALTH)
      end
    end
  end
end
