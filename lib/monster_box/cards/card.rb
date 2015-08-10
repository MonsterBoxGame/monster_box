module MonsterBox
  module Cards
    class Card
      attr_reader :name, :cost

      def initialize(name, cost, text)
        @name = name
        @cost = cost
        @text = text
      end

      def play
        raise 'Not implemented'
      end
    end
  end
end
