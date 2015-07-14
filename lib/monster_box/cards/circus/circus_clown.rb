module MonsterBox
  module Cards
    module Circus
      class CircusClown < Base
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
end
