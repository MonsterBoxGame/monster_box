module MonsterBox
  module Cards
    module Circus
      class BasicClown < Base
        NAME = 'Basic Clown'
        COST = 1
        TEXT = 'GUARD'
        ATTACK = 1
        HEALTH = 3
        HAS_GUARD = true

        def initialize
          super(NAME, COST, TEXT, ATTACK, HEALTH, HAS_GUARD)
        end
      end
    end
  end
end
