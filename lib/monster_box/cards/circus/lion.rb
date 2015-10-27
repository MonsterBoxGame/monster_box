module MonsterBox
  module Cards
    module Circus
      Lion = Builders::Circus.new('Lion')
                             .cost(3)
                             .health(3)
                             .attack(4)
                             .build
    end
  end
end
