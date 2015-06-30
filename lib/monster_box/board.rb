module MonsterBox
  class Board
    attr_reader :monsters

    def initialize
      @monsters = []
      @dead = []
    end

    def summon(monster_card)
      @monsters.concat(monster_card.summon)
    end

    def next_turn
      @monsters.each { |monster| monster.next_turn }
    end

    def attack_monster(other_board, attacker, target)
      if @monsters.include?(attacker)
        other_board.being_attacked(attacker, target)
        remove_dead_mosters
      else
        raise IllegalMove.new('No such attacker')
      end
    end

    def being_attacked(attacker, target)
      if @monsters.include?(target)
        attacker.attack_target(target)
        remove_dead_mosters
      else
        raise IllegalMove.new('No such target')
      end
    end

    def remove_dead_mosters
      @monsters.dup.each do |monster|
        unless monster.alive?
          @monsters.delete(monster)
          @dead << monster
        end
      end
    end

    def has_guards?
      guards.size > 0
    end

    def has_guard?(monster)
      guards.include?(monster)
    end

    def guards
      @monsters.select do |monster|
        monster.has_guard
      end
    end
  end
end
