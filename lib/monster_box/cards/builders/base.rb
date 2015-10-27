module MonsterBox
  module Cards
    module Builders
      class Base
        GUARD_TEXT = 'GUARD'
        DYING_WISH_TEXT = 'DYING WISH'
        BURST_TEXT = 'BURST'
        DEFAULT_COST = 0
        DEFAULT_TEXT = ''
        DEFAULT_ATTACK = 0
        DEFAULT_HEALTH = 0
        DEFAULT_HAS_GUARD = false
        DEFAULT_HAS_DYING_WISH = false
        DEFAULT_HAS_BURST = false

        def initialize(name)
          @name = name
          @cost = DEFAULT_COST
          @text = DEFAULT_TEXT
          @attack = DEFAULT_ATTACK
          @health = DEFAULT_HEALTH
          @has_guard = DEFAULT_HAS_GUARD
          @has_dying_wish = DEFAULT_HAS_DYING_WISH
          @has_burst = DEFAULT_HAS_BURST
        end

        def superclass
          raise 'No superclass defined'
        end

        def cost(cost)
          @cost = cost
          self
        end

        def text(text)
          @text = text
          self
        end

        def attack(attack)
          @attack = attack
          self
        end

        def health(health)
          @health = health
          self
        end

        def has_guard
          @has_guard = true
          self
        end

        def has_dying_wish
          @has_dying_wish = true
          self
        end

        def has_burst
          @has_burst = true
          self
        end

        def build(&block)
          card_class = Class.new(superclass) do
            def initialize
              super(self.class::NAME,
                    self.class::COST,
                    self.class::TEXT,
                    self.class::ATTACK,
                    self.class::HEALTH,
                    self.class::HAS_GUARD,
                    self.class::HAS_DYING_WISH,
                    self.class::HAS_BURST)
            end

            class_eval &block if block
          end
          card_class.const_set('NAME', @name)
          card_class.const_set('COST', @cost)
          card_class.const_set('TEXT', build_text)
          card_class.const_set('ATTACK', @attack)
          card_class.const_set('HEALTH', @health)
          card_class.const_set('HAS_GUARD', @has_guard)
          card_class.const_set('HAS_DYING_WISH', @has_dying_wish)
          card_class.const_set('HAS_BURST', @has_burst)
          card_class
        end

        private

        def build_text
          if @has_dying_wish
            @text = "#{DYING_WISH_TEXT}: #{@text}"
          end
          if @has_burst
            @text = "#{BURST_TEXT}\n#{@text}"
          end
          if @has_guard
            @text = "#{GUARD_TEXT}\n#{@text}"
          end
          @text
        end
      end
    end
  end
end
