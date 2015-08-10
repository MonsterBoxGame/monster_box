module MonsterBox
  module Cards
    module Circus
      class Lion < Base
        NAME = 'Lion'
        COST = 3
        TEXT = ''
        ATTACK = 4
        HEALTH = 3

        def initialize
          super(NAME, COST, TEXT, ATTACK, HEALTH)
        end
      end
    end
  end
end
