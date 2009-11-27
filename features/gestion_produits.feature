Feature: manage produits
  In order to enter new cases in galacsi
  As a user
  I want to be able to list, show, create and update produits

  # a user with admin role has all powers
  Scenario: show edit produit as admin
    Given a produit exists
      And I am logged in as a user in the admin role
    When I go to the produit's page
    Then I should see "Modifier"

  # a user with guest role is a non authentified user
  Scenario: hide edit produit link as guest
    Given a produit exists
    When I go to the produit's page
    Then I should not see "Modifier"

  Scenario: create a produit
    Given I am logged in as a user in the admin role
      And I am on the produits page
    When I follow "Nouveau produit"
      And I fill in "nom" with "lamotrigine"
      And I press "Sauvegarder"
    Then a produit should exist with name: "lamotrigine"

  Scenario: update a produit
    Given a produit exists
      And I am logged in as a user in the admin role
    When I go to the produit's edit page
      And I fill in "nom" with "lamotrigina"
      And I press "Sauvegarder"
    Then a produit should exist with name: "lamotrigina"

  # a user with valideur role can create, update and validate
  Scenario: validate prouits as valideur
    Given a produit exists with validation: "0"
      And I am logged in as a user in the valideur role
    When I go to the produit's page
      And I follow "Valider"
    Then I should see "Successfully validated produit."
      And a produit should exist with validation: "1"

  Scenario: hide validate link if validated produit
    Given a produit exists with validation: "1"
    When I go to the produit's page
    Then I should not see "Valider"

  Scenario: list nonvalidated produits as valideur
    Given 5 produits exist with validation: "0"
      And I am logged in as a user in the valideur role
    When I go to the produits page
      And I follow "Produits non validés"
    Then I should see "Produits à valider (5)"
