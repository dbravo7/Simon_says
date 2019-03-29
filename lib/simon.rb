require 'colorize'
require "byebug"
class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false 
    @seq = []
  end

  def play
    until game_over 
      take_turn
    end 
    game_over_message
    reset_game
  end

  def take_turn
    show_sequence
    if require_sequence
      round_success_message
      @sequence_length += 1
    else 
      @game_over = true  
    end 
  end

  def show_sequence
    system("clear")
    puts "#{add_random_color.join(" ")}"
    sleep(1)
    system("clear")
  end

  def require_sequence
    key = {"r"=>"red", "g"=>"green", "y"=>"yellow", "b"=>"blue"}
    puts "Enter the correct sequence: r = red, g = green, y = yellow, b = blue"
    pattern = gets.chomp
    string = pattern.split("").map {|char| key[char]}
    debugger 
    puts "#{string.join(" ")}"
    debugger 
    string == seq
  end

  def add_random_color
    seq << COLORS[rand(0..3)]
  end

  def round_success_message
    puts "Excellent job. Your pattern matches Simon's"
  end

  def game_over_message
    puts "That pattern is incorrect. Better luck next time"
  end

  def reset_game
    @sequence_length = 1 
    @game_over = false 
    @seq = []
  end
end

if $PROGRAM_NAME == __FILE__
  Simon.new.play 
end 