module MonsterBox
  module Cards
    class Crystal < Spell
      NAME = 'Crystal'
      COST = 0
      TEXT = 'Gain an unspent crystal'

      def initialize
        super(NAME, COST, TEXT)
      end

      def play(*args)
        player = args[0]
        player.crystal_bar.gain_extra_crystals(1)
      end
    end
  end
end
