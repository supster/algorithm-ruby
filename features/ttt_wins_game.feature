Feature: tic-tac-toe win game

  As a player
  I want to win a game
  if I have enough combination

  Scenario Outline: win game
    Given I am a player
    When I have these "<combination>"
    Then I win the game

    Scenarios: winnings
      | combination |
      | 0,1,2 |
      | 3,4,5 |
      | 6,7,8 |
      | 0,3,6 |
      | 1,4,7 |
      | 2,5,8 |
      | 0,4,8 |
      | 2,4,6 |
