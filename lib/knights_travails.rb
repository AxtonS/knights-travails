# frozen_string_literal: true

# used to save the game state
class Chess
  attr_accessor :board, :knight

  def initialize(knight_y = 4, knight_x = 3)
    if (knight_y.negative? || knight_y > 7) || (knight_x.negative? || knight_x > 7)
      return puts 'Invalid knight placement'
    else
      @board = [%w[a8 b8 c8 d8 e8 f8 g8 h8],
                %w[a7 b7 c7 d7 e7 f7 g7 h7],
                %w[a6 b6 c6 d6 e6 f6 g6 h6],
                %w[a5 b5 c5 d5 e5 f5 g5 h5],
                %w[a4 b4 c4 d4 e4 f4 g4 h4],
                %w[a3 b3 c3 d3 e3 f3 g3 h3],
                %w[a2 b2 c2 d2 e2 f2 g2 h2],
                %w[a1 b1 c1 d1 e1 f1 g1 h1]]
      @knight = @board[knight_y][knight_x]
    end
  end
end

game = Chess.new
puts game.knight
