module MonsterBox
  module Cards
    class Monster < Card
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

      def attack_target(target)
        if attack > 0
          target.being_attacked(self)
        else
          raise IllegalMove
        end
      end
    end
  end
end
