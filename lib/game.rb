require_relative 'player'
require_relative 'attack'
class Game

  attr_reader :player1, :attack, :winner, :computer_action, :player2

  def self.start(p1_name,p2_name)
    player1 = Player.new(p1_name)
    player2 = Player.new(p2_name)
    @instance = new(player1,player2)
  end

  def self.instance
    @instance
  end

  def initialize (player1,player2,attack = Attack.new)
    @player1 = player1
    @player2 = player2
    @attack = attack
    @computer_action = nil
    @winner = nil
    @singleplayer = true
  end

  def process_turn
    @computer_action = attack.generate_random_attack if singleplayer == true
    @winner = attack.calculate_attack(player1.last_action,computer_action)
  end

  def pretty_print_winner
    case
      when winner == 1
        "Congratulations #{player1.name} has won!"
      when winner == 2 && singleplayer == true
        "Ooooo - The AI has beaten you ;)"
      when winner == 2 && singleplayer == false
        "Unlucky - #{player2.name} has won!"
      when winner == 0
        "It's a draw"
    end
  end

private

attr_reader :singleplayer

end