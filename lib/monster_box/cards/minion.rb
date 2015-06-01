module MonsterBox
  module Cards
    class Minion < Card
      attr_reader :attack, :health

      def initialize(name, cost, attack, health)
        super(name, cost)
        @attack = attack
        @health = health
      end
    end
  end
end
