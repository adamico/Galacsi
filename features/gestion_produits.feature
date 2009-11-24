Feature: manage produits
  In order to enter new cases in galacsi
  As the admin
  I want to be able to create and modify produits

  Background:
    Given an user exists
      And another user exists with username: "bob", password: "hidden"
      And a role exists
      And another role exists with name: "guest"
      And an assignment exists with user: the first user, role: the first role
      And another assignment exists with user: the 2nd user, role: the 2nd role

  Scenario: show edit produit as admin
    Given I am logged in as "fred" with password "secret"
      And a produit exists
    When I go to the produit's page
    Then I should see "Edit"

@wip
  Scenario: hide edit produit link as guest
    Given I am logged in as "bob" with password "hidden"
      And a produit exists
    When I go to the produit's page
    Then I should not see "Edit"

  Scenario: create a produit
    Given I am on the homepage
    When I follow "Créer un produit"
      And I fill in "name" with "lamotrigine"
      And I press "Sauvegarder"
    Then I should see "lamotrigine"

  Scenario: update a produit
    Given a produit exists
    When I go to the produit's edit page
      And I fill in "name" with "lamotrigina"
      And I press "Sauvegarder"
    Then I should see "lamotrigina"
