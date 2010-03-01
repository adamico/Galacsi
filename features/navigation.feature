Feature: navigation features
  In order to move fast in Galacsi pages
  As a user
  I want to use a navigation system

  Scenario: home page
    When I go to the homepage
    Then I should see "Bienvenue!"

  Scenario: show link for search form
    When I go to the homepage
    Then I should see "Recherche"
    
