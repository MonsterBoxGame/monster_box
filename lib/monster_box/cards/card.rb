module MonsterBox
  module Cards
    class Card
      attr_reader :name, :cost

      def initialize(name, cost)
        @name = name
        @cost = cost
      end

      def play
        raise 'Not implemented'
      end
    end
  end
end
