module MonsterBox
  module Cards
    class Card
      attr_reader :name, :cost

      def initialize(name, cost, text)
        @name = name
        @cost = cost
        @text = text
      end

      def play(*args)
        raise 'Not implemented'
      end

      def is_monster?
        raise 'Not implemented'
      end
    end
  end
end
