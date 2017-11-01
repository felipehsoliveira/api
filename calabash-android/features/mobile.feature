Feature: Mobile application tests for humming bird challenge

Scenario: Full Search
    Given I am in the Moviest App
    And I touch on Search field
    When I search for a "2 fast 2 furious"
    Then I hope to see the movie in the top one search

Scenario: Parcial Search
    Given I am in the Moviest App
    And I touch on Search field
    When I look for a movie with the partially complete name
    Then I hope to see the "the lord of the rings" related to the search term

Scenario: Test Img Movie
    Given I am in the Moviest App
    And I touch on Search field
    When I search for a "legend"
    Then I hope to see the "imageview" of the movie

Scenario: Sinopse Test
    Given I am in the Moviest App
    And I touch on Search field
    When I search for a "legend"
    Then I hope to see the Sinopse of the movie

Scenario: Empty Search
    Given I am in the Moviest App
    And I touch on Search field
    When I leave the search field empty
    Then I do not expect to see any search results

Scenario: Invalid Movie
    Given I am in the Moviest App
    And I touch on Search field
    When I leave the search field empty
    Then I do not expect to see any search results

Scenario: Scroll Test Home
     Given I am in the Moviest App
     When I Scroll down the movie list
     Then I hope the scroll continues non-stop

Scenario: Scroll Test Search Page
    Given I am in the Moviest App
     And I touch on Search field
     And I search for a "movie"
     When I Scroll down the movie list
     Then I hope the scroll continues non-stop
