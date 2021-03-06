module MonsterBox
  module Cards
    class Monster < Card
      include Observable

      attr_reader :attack, :health, :can_attack, :has_guard, :has_burst

      def initialize(name,
                     cost,
                     text,
                     attack,
                     health,
                     has_guard = false,
                     has_dying_wish = false,
                     has_burst = false)
        super(name, cost, text)
        @attack = attack
        @health = health
        @has_guard = has_guard
        @has_dying_wish = has_dying_wish
        @has_burst = has_burst
        @can_attack = has_burst
      end

      def play(*args)
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

      def died
      end

      def is_monster?
        true
      end
    end
  end
end
