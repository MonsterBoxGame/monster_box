module MonsterBox
  module Cards
    class Monster < Card
      attr_reader :attack, :health, :can_attack

      def initialize(name, cost, attack, health)
        super(name, cost)
        @attack = attack
        @health = health
        @can_attack = false
      end

      def play
        summon
      end

      def summon
        [self]
      end

      def attack_target(target)
        if @can_attack
          if attack > 0
            target.being_attacked(self)
            @can_attack = false
          else
            raise IllegalMove.new('Monster has no attack')
          end
        else
          raise IllegalMove.new('Monster cannot attack')
        end
      end

      def being_attacked(attacker)
        take_damage(attacker.attack)
        attacker.take_damage(@attack)
      end

      def take_damage(amount)
        @health -= amount
      end

      def next_turn
        @can_attack = true
      end

      def alive?
        @health > 0
      end
    end
  end
end
