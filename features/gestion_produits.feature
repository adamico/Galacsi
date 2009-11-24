Feature: manage produits
  In order to enter new cases in galacsi
  As the admin
  I want to be able to create and modify produits

  Background:
    Given a produit exists

  Scenario: show edit produit as admin
    Given I am logged in as a user in the admin role
    When I go to the produit's page
    Then I should see "Edit"

  Scenario: hide edit produit link as guest
    When I go to the produit's page
    Then I should not see "Edit"

  Scenario: create a produit
    Given I am logged in as a user in the admin role
      And I am on the produits page
    When I follow "New Produit"
      And I fill in "name" with "lamotrigine"
      And I press "Sauvegarder"
    Then I should see "lamotrigine"

  Scenario: update a produit
    Given I am logged in as a user in the admin role
    When I go to the produit's edit page
      And I fill in "name" with "lamotrigina"
      And I press "Sauvegarder"
    Then I should see "lamotrigina"
