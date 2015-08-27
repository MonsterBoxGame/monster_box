module MonsterBox
  module Cards
    module Circus
      Ringmaster = Builders::Circus.new('Ringmaster')
                                .cost(4)
                                .health(2)
                                .attack(2)
                                .text('When played, summon a 4/3 Lion')
                                .build do
        def summon
          [self, Lion.new]
        end
      end
    end
  end
end
