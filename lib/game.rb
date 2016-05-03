class Game
  def initialize
    @board = Array.new(9)
  end

  def start
    print_board
  end

  def board
    @board
  end

  def print_board
    s = ''
    @board.each_with_index do |b, i|
      mark = b.nil? ? i : b
      s += " #{mark} "
      s += i > 0 && ((i+1) % 3 == 0) ? "\n" : '|'
    end
    puts "#{s}\n"
  end

  def play(player, box)
    if !@last_player.nil? && @last_player == player
      puts 'Invalid Player'
      return false
    end

    if !@board[box].nil?
      puts 'Invalid box'
      return false
    end

    @board[box] = player
    @last_player = player

    print_board

    return true
  end

  def win?(player)
    winning_combinations =
      ['0,1,2',
      '3,4,5',
      '6,7,8',
      '0,3,6',
      '1,4,7',
      '2,5,8',
      '0,4,8',
      '2,4,6']

    win = false
    winning_combinations.each do |com|
      boxes = com.split(',').map(&:to_i)
      boxes.each do |box|
        if @board[box] != player
          win = false
          break
        else
          win = true
        end
      end
      break if win
    end

    return win
  end
end