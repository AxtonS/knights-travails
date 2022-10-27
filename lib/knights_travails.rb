# frozen_string_literal: true

require 'pry-byebug'

# contains board grid and possible moves
class Board
  attr_accessor :coordinates

  def initialize
    @coordinates = [%w[a8 b8 c8 d8 e8 f8 g8 h8],
                    %w[a7 b7 c7 d7 e7 f7 g7 h7],
                    %w[a6 b6 c6 d6 e6 f6 g6 h6],
                    %w[a5 b5 c5 d5 e5 f5 g5 h5],
                    %w[a4 b4 c4 d4 e4 f4 g4 h4],
                    %w[a3 b3 c3 d3 e3 f3 g3 h3],
                    %w[a2 b2 c2 d2 e2 f2 g2 h2],
                    %w[a1 b1 c1 d1 e1 f1 g1 h1]]
  end

  def valid_move?(position_y, position_x)
    return false if (position_y.negative? || position_y > 7) || (position_x.negative? || position_x > 7)

    true
  end
end

# contains knight's position
class Knight
  attr_accessor :position, :position_y, :position_x, :board

  def initialize(position_y = 4, position_x = 4, parent = nil)
    if (position_y.negative? || position_y > 7) || (position_x.negative? || position_x > 7)
      puts 'Invalid knight placement'
    else
      @board = Board.new
      @position_y = position_y
      @position_x = position_x
      @position = board.coordinates[position_y][position_x]
      @parent = parent
    end
  end

  def index
    row = @board.coordinates.detect { |row| row.include?(@position)}
    array = [@board.coordinates.index(row), row.index(@position)]
  end

  def available_moves
    moves = []
    if @board.valid_move?(position_y - 2, position_x + 1)
      moves.push << Knight.new(position_y - 2, position_x + 1, self)
    end
    if @board.valid_move?(position_y - 1, position_x + 2)
      moves.push << Knight.new(position_y - 1, position_x + 2, self)
    end
    if @board.valid_move?(position_y + 1, position_x + 2)
      moves.push << Knight.new(position_y + 1, position_x + 2, self)
    end
    if @board.valid_move?(position_y + 2, position_x + 1)
      moves.push << Knight.new(position_y + 2, position_x + 1, self)
    end
    if @board.valid_move?(position_y + 2, position_x - 1)
      moves.push << Knight.new(position_y + 2, position_x - 1, self)
    end
    if @board.valid_move?(position_y + 1, position_x - 2)
      moves.push << Knight.new(position_y + 1, position_x - 2, self)
    end
    if @board.valid_move?(position_y - 1, position_x - 2)
      moves.push << Knight.new(position_y - 1, position_x - 2, self)
    end
    if @board.valid_move?(position_y - 2, position_x - 1)
      moves.push << Knight.new(position_y - 2, position_x - 1, self)
    end
    moves
  end

  def find_path(target, moves = available_moves)
    moves.each { |move| return move if move.position == target}

    next_moves = []
    moves.each do |move|
      move.available_moves.each { |step| next_moves.push << step}
    end
    return find_path(target, next_moves) if find_path(target, next_moves).position == target
  end
end

knight = Knight.new
p knight.position
p knight.find_path('h1').position
