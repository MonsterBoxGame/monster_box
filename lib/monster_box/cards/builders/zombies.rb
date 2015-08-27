module MonsterBox
  module Cards
    module Builders
      class Zombies < Base
        def superclass
          MonsterBox::Cards::Zombies::Base
        end
      end
    end
  end
end
