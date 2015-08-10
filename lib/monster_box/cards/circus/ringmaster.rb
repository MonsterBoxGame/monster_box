module MonsterBox
  module Cards
    module Circus
      class Ringmaster < Base
        NAME = 'Ringmaster'

        COST = 4
        ATTACK = 2
        TEXT = 'When played, summon a 4/3 Lion'
        HEALTH = 2
        HAS_GUARD = false

        def initialize
          super(NAME, COST, TEXT, ATTACK, HEALTH, HAS_GUARD)
        end

        def summon
          [self, Lion.new]
        end
      end
    end
  end
end
