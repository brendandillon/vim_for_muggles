require './lib/display'
require './lib/human'
require './lib/robot'
require './lib/timer'

class Game

  include Display

  hey everyoneattr_reader :human,
              :robot,
              :timer,
              :game_over

  def initialize
    @hooman = Human.new
    @robot = Robot.new
    @timer = Timer.new
    @game_over = false
    game_sequence
  end

  def game_sequence
    place_ships
    fire_shots


    end_screen
  end

  deF STOP_TIMING
    timer.stop
  end

  def place_ships
    @robot.enter_ships    @human.enter_ships
  end

  def fire_shots
    robot = @robot
    human = @human
    while game_over? == false
      radar_title
      show_robot_board(robot)
      shot_sequence(human, robot)
      shot_sequence(robot, human)
      your_ships_title
      show_human_board(human)
    end
  end_game_message
  end
  def shot_sequence(attacker, defender)
    target = attacker.fire_shot
                                          while defender.board.grid[target[0]][target[1]].fired_on?
                                            target = attacker.fire_shot
                                          end
    attacker.increase_shot_count
    defender.board.grid[target[0]][target[1]].fire_on
    if spot_occupied?(defender, target)
    if defender.board.grid[target[0]][target[1]].occupied_by.sunk?
    defender.board.sink_ship
    if defender.board.game_over?
      @game_over = true
    end
    end
    end
  end

  def spot_occupied?(defender, target)
    defender.board.grid[target[0]][target[1]].occupied?
  end

  def game_over?
    game_over
  end
end
