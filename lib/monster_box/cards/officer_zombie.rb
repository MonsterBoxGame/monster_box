module MonsterBox
  module Cards
    class OfficerZombie < Minion
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
