require 'game'

Given(/^I am a player$/) do
end

When(/^I start a new game$/) do
  @game = Game.new
end

Then(/^I should see an empty tic\-tac\-toe board$/) do
  expect{ @game.start }.to output(" 0 | 1 | 2 \n 3 | 4 | 5 \n 6 | 7 | 8 \n\n").to_stdout
end

When(/^I select a number$/) do
  @game = Game.new
  @game.play(:x, 0)
end

Then(/^I mark a box$/) do
  expect{ @game.print_board }.to output(" x | 1 | 2 \n 3 | 4 | 5 \n 6 | 7 | 8 \n\n").to_stdout
end

When(/^I have these "([^"]*)"$/) do |combination|
  @game = Game.new
  boxes = combination.split(',').map(&:to_i)

  boxes.each do |box|
    @game.play(:x, box)

    @game.board.each_with_index do |box, i|
      if box.nil? && !boxes.include?(i)
        @game.play(:o, i)
        break
      end
    end unless @game.win?(:x)
  end
end

Then(/^I win the game$/) do
  expect(@game.win?(:x)).to eq(true)
end