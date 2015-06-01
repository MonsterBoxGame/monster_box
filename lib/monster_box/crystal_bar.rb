module MonsterBox
  class CrystalBar
    MAX_CRYSTALS = 10
    STARTING_CRYSTALS = 1
    TURN_GAIN = 1

    def self.initial
      CrystalBar.new(STARTING_CRYSTALS)
    end

    def spend(number)
      @unspent = @unspent - number
    end

    def next_turn
      gain_empty_crystals(TURN_GAIN)
      @unspent = @total
    end

    def gain_empty_crystals(number)
      @total += number
      if @total > MAX_CRYSTALS
        @total = MAX_CRYSTALS
      end
    end

    def gain_unspent_crystals(number)
      @unspent += number
      if @unspent > @total
        @unspent = @total
      end
    end

    def enough_crystals?(cost)
      cost <= @unspent
    end

    private

    def initialize(total)
      @total = total
      @unspent = @total
    end
  end
end
