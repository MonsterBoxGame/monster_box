module MonsterBox
  module Cards
    class Minion < Card
      attr_reader :attack, :health

      def initialize(name, cost, attack, health)
        super(name, cost)
        @attack = attack
        @health = health
      end

      def play
        summon
      end

      def summon
        [self]
      end
    end
  end
end
