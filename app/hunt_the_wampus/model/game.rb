require_relative 'agent'

class HuntTheWampus
  module Model
      class Game
      attr_reader :score, :status
      attr_writer :board
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
        @agent.location
      end

      def agent_location=(location)
        @agent.location = location
      end

      def agent_alive=(alive)
        @agent.alive = alive
      end

      def board
        @board
      end

      def game_state?
        @game_state
      end

      def move_agent(horizontal, vertical)
        @score -= 1
        new_location = [@agent.location[0] + horizontal, @agent.location[1] + vertical]

        # checks board limits
        if new_location[0] < 0 || new_location[0] >= @board.length || new_location[1] < 0 || new_location[1] >= @board[0].length
          return
        end

        #updates agent location and board
        @agent.location = new_location

        @board.map {|l| l.map {|c| c.delete(:agent)}}
        @board[@agent.location[0]][@agent.location[1]].unshift(:agent)

        #finds the wampus
        if @board[@agent.location[0]][@agent.location[1]].include?(:wampus)
          @agent.alive = false
          @status = :lost
          return
        end
      end

      def move_up
        move_agent(-1, 0)
      end

      def move_down
        move_agent(1, 0)
      end

      def move_left
        move_agent(0, -1)
      end

      def move_right
        move_agent(0, 1)
      end



        # #falls into a pit
        # if @board[new_location[0]][new_location[1]].include?(:pit)
        #   @agent.alive = false
        #   @status = :lost
        #   return
        # end

        # #finds the gold
        # if @board[new_location[0]][new_location[1]].include?(:gold)
        #   @gold_found = true
        #   @score += 999
        # end
        # #finds the exit
        # if @board[new_location[0]][new_location[1]].include?(:exit)
        #   @status = :won
        # end

      def shoot_arrow(horizontal, vertical)
        @agent.has_arrow = false
      end
    end
  end
end
