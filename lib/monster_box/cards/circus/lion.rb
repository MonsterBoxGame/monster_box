module MonsterBox
  module Cards
    module Circus
      class Lion < Base
        NAME = 'Lion'

        COST = 3
        ATTACK = 4
        HEALTH = 3
        HAS_GUARD = false

        def initialize
          super(NAME, COST, ATTACK, HEALTH, HAS_GUARD)
        end
      end
    end
  end
end
