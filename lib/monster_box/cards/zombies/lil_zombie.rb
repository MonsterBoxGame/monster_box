module MonsterBox
  module Cards
    module Zombies
       LilZombie = MonsterBox::Cards::Builders::Zombies.new(
         'Lil Zombie').cost(1)
                      .health(1)
                      .attack(1)
                      .build
    end
  end
end
