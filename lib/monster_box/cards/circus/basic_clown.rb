module MonsterBox
  module Cards
    module Circus
      BasicClown = Builders::Circus.new('Basic clown')
                                .cost(1)
                                .health(3)
                                .attack(1)
                                .has_guard
                                .build
    end
  end
end
