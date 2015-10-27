module MonsterBox
  module Cards
    module Circus
      HumanCannonball = Builders::Circus.new('Human Cannonball')
                                        .cost(1)
                                        .health(1)
                                        .attack(3)
                                        .build
    end
  end
end

                                        #.cost(3)
                                        #.has_burst
