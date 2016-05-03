Feature: tic-tac-toe start game

  As a player
  I want to start a game
  so I can play

  Scenario: start game
    Given I am a player
    When I start a new game
    Then I should see an empty tic-tac-toe board

