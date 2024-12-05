class HuntTheWampus
  module Model
    class Agent
      # TODO implement
      attr_accessor :location, :alive, :has_arrow

      def initialize
        @has_arrow = true
        @alive = true
        @location = [3, 0]
      end

      def has_arrow?
        @has_arrow
      end

      def alive?
        @alive
      end

      def die!
        @alive = false
      end
    end
  end
end
