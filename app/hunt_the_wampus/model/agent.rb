class HuntTheWampus
  module Model
    class Agent
      # TODO implement
      attr_reader :has_arrow
      attr_accessor :location, :alive

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
    end
  end
end
