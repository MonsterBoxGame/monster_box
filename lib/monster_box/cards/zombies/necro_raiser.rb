module MonsterBox
  module Cards
    module Zombies
      include Observable

       NecroRaiser = Builders::Zombies.new(
         'Necro-raiser').cost(6)
                        .health(6)
                        .attack(3)
                        .text('Dying wish: Summon 3 1/1 Lil Zombies')
                        .build do

        def died
          changed
          notify_observers(
            Events::Monsters::SUMMON_MONSTERS,
            [ MonsterBox::Cards::Zombies::LilZombie.new,
              MonsterBox::Cards::Zombies::LilZombie.new,
              MonsterBox::Cards::Zombies::LilZombie.new ]
          )
        end
      end
    end
  end
end
