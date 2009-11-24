Feature: Galacsi modifiers are authenticated
  In order to: restrict Galacsi edit access to authorized users
  A: users
  Should: authenticate themselves to the application
  To: protect confidential data

  Background:
    Given a produit exists

  Scenario: authenticate to modify produits
    Given an user exists with username: "myuser"
      And the user is not authenticated
    When I visit the produit's page
    Then I should see the user authentication page

