module MonsterBox
  module Cards
    module Zombies
      class OfficerZombie < Base
        NAME = 'Officer Zombie'
        COST = 2
        TEXT = ''
        ATTACK = 2
        HEALTH = 3

        def initialize
          super(NAME, COST, TEXT, ATTACK, HEALTH)
        end
      end
    end
  end
end
