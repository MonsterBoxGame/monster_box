module MonsterBox
  module Cards
    module Zombies
      OfficerZombie = MonsterBox::Cards::Builders::Zombies.new('Officer Zombie')
                                    .cost(2)
                                    .health(3)
                                    .attack(2)
                                    .build
    end
  end
end
