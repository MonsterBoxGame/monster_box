module MonsterBox
  module Cards
    module Circus
      class Ringmaster < Base
        NAME = 'Ringmaster'

        COST = 4
        ATTACK = 2
        HEALTH = 2
        HAS_GUARD = false

        def initialize
          super(NAME, COST, ATTACK, HEALTH, HAS_GUARD)
        end

        def summon
          [self, Lion.new]
        end
      end
    end
  end
end
