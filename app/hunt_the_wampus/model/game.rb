require_relative 'agent'

class HuntTheWampus
  module Model
    attr_reader :score, :status
    class Game
      # TODO implement

      def initialize
        @agent =  HuntTheWampus::Model::Agent.new
        @score = 0
        @board = [
          [[:stench], [], [], [:exit]],
          [[:wampus], [:gold, :stench], [], []],
          [[:stench], [], [:breeze], []],
          [[:agent], [:breeze], [:pit], [:breeze]],
        ]
        @status = :playing
        @gold_found = false
        @agent_location = [3, 0]
        @wampus_is_alive = true
      end

      def status
        @status
      end

      def agent_alive?
        @agent.alive?
      end

      def agent_dead?
        !@agent.alive?
      end

      def has_arrow?
        @agent.has_arrow?
      end

      def wampus_is_alive?
        @wampus_is_alive
      end

      def wampus_dead
        !@wampus.is_alive
        @score += 100
      end

      def score
        @score
      end

      def agent_location
        @agent_location
      end

      def board
        @board
      end

      def gold_found
        @gold_found = true
        @score += 1000
      end

      def grab_gold
        @score -= 1
      end

      def game_state?
        @game_state
      end

      def move_up
        move_agent(-1, 0)
        @agent_location[0] -= 1
      end

      def move_down
        move_agent(1, 0)
        @agent_location[0] += 1
      end

      def move_left
        move_agent(0, -1)
        @agent_location[1] -= 1
      end

      def move_right
        move_agent(0, 1)
        @agent_location[1] += 1
      end

      def move_agent(direction)
        @score = -1
      end

      def agent_cell
        @board[@agent_location[0]][@agent_location[1]]
      end

      def shoot_arrow(direction)
        @agent.has_arrow = false
      end
    end
  end
end
