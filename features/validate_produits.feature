Feature: validate produits
  As a user in the valideur role
  I want to list non validated produits, complete, update and validate them
  In order to have up to date informations for taking drug during breastfeeding

  Background:
    Given I am logged in as a valideur

  Scenario: list non validated produits
    Given I have 5 non validated produits
    When I go to the homepage
      And I follow "Valider un produit"
    Then I should see "Produits à valider (5)"

  Scenario: validate a produit
    Given I have 5 non validated produits
    When I go to the first produit's page
      And I follow "Valider"
    Then I should see "Le produit a été validé."
      And I should have 1 validated produit
      And I should have 4 nonvalidated produits

  Scenario: hide validate link if validated produit
    Given I have a validated produit
    When I go to the produit's page
    Then I should not see "Valider"
