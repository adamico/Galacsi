Feature: validate produits
  As a valideur
  I want to move up produits in the validation workflow
  In order to have up to date informations for taking drug during breastfeeding

  Background:
    Given the following produits exist
      | state     |
      | brouillon |
      | a_valider |
      | valide    |
      | en_attente|
    And I am logged in as a valideur

  Scenario Outline: valideurs can "initialiser", "valider" and "geler"
    When I go to the <position> produit's page
    Then I should <action>
    Scenarios:
      | position | action               |
      | first    | see "Initialiser"    |
      | 2nd      | see "Valider"        |
      | 3th      | see "Invalider"      |
      | 4th      | see "Valider"        |
