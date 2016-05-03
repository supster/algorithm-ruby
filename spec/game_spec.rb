require 'game'

describe Game do
  let(:game) { Game.new }
  before {
    allow($stdout).to receive(:puts)
  }

  context '#board' do
    it 'starts with an empty board' do
      expect(game.board).to eq(Array.new(9))
    end
  end

  context '#play' do
    it 'receive a player and a box' do
      expect(game.play(:x, 0)).to eq(true)
    end

    it 'mark the box with user' do
      game.play(:x, 0)
      expect(game.board[0]).to eq(:x)
    end

    it 'alternate player' do
      game.play(:x, 0)
      expect(game.play(:x, 1)).to eq(false)
    end

    it 'not allow selected box' do
      game.play(:x, 1)
      expect(game.play(:y, 1)).to eq(false)
    end
  end

  context '#win?' do
    it 'returns false if nil' do
      game.start
      expect(game.win?(:x)).to eq(false)
    end

    it 'returns false if not win' do
      game.play(:x, 0)
      expect(game.win?(:x)).to eq(false)
    end

    it 'returns true if win' do
      game.play(:x, 0)
      game.play(:O, 3)
      game.play(:x, 1)
      game.play(:O, 4)
      game.play(:x, 2)
      expect(game.win?(:x)).to eq(true)
    end
  end
end