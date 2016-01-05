module MonsterBox
  class CrystalBar
    MAX_CRYSTALS = 10
    FIRST_STARTING_CRYSTALS = 1
    SECOND_STARTING_CRYSTALS = 0
    TURN_GAIN = 1

    def self.init_first
      CrystalBar.new(FIRST_STARTING_CRYSTALS)
    end

    def self.init_second
      CrystalBar.new(SECOND_STARTING_CRYSTALS)
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

    def gain_extra_crystals(number)
      @unspent += number
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
