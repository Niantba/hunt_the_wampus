class HuntTheWampus
  module Model
    attr_reader :has_arrow, :is_alive
    class Agent
      # TODO implement

      def initialize
        @has_arrow = true
        @alive = true
      end

      def has_arrow?
        @has_arrow
      end

      def alive?
        @has_arrow
      end

    end
  end
end
