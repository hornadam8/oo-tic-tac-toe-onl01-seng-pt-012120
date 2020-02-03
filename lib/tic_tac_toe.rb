class TicTacToe
  
  def initialize
    @board = [" "," "," "," "," "," "," "," "," "]
  end
  
  WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
  
  def display_board
    print " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    print "-----------"
    print " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    print "-----------"
    print " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
  def input_to_index(num)
    num.to_i - 1
  end
  
  def move(i,let = "X")
    @board[i] = let
  end
  
  def position_taken?(i)
    @board[i] != " "
  end
  
  def valid_move?(i)
    @board[i] == " " && i > -1 && i < 9
  end
  
  def turn_count
    turns = []
    @board.each do |x|
      if x != " "
        turns << x
      end
    end
    turns.count
  end
  
  def current_player
    if self.turn_count.odd?
      "O"
    else
      "X"
    end
  end
  
  def turn
    puts "Select a space. 1-9, 1 for top-right, 9 for bottom left."
    i = self.input_to_index(gets)
    if self.valid_move?(i)
      self.move(i , self.current_player)
      self.display_board
    else
      self.turn
    end
  end
  
  def won?
    WIN_COMBINATIONS.detect do |win_combo|
      if (@board[win_combo[0]]) == "X" && (@board[win_combo[1]]) == "X" && (@board[win_combo[2]]) == "X"
        return win_combo
      elsif (@board[win_combo[0]]) == "O" && (@board[win_combo[1]]) == "O" && (@board[win_combo[2]]) == "O"
        return win_combo
      end
      false
    end
  end
  
  def full?
    @board.include?(" ") ? false : true
  end
  
  def draw?
    if self.won?
      return false
    elsif ! self.full?
      return false
    else
      return true
    end
  end
  
  def over?
    if self.draw?
      return true
    elsif self.won?
      return true
    else
      return false
    end
  end
  
  def winner
    WIN_COMBINATIONS.detect do |win_combo|
      if (@board[win_combo[0]]) == "X" && (@board[win_combo[1]]) == "X" && (@board[win_combo[2]]) == "X"
        return "X"
     elsif (@board[win_combo[0]]) == "O" && (@board[win_combo[1]]) == "O" && (@board[win_combo[2]]) == "O"
        return "O"
      else
        nil
      end
    end
  end
  
  def play
    until self.over?
      self.turn
    end
    if self.won?
      puts "Congratulations #{self.winner}!"
    elsif self.draw?
      puts "Cat's Game!"
    end
  end
end