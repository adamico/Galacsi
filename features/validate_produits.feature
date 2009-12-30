Feature: validate produits
  As a valideur
  I want to move up produits in the validation workflow
  In order to have up to date informations for taking drug during breastfeeding

  Background:
    Given I am logged in as a valideur

  Scenario Outline: valideurs can "initialiser", "valider" and "geler"
    Given the following produits exist
      | state     |
      | brouillon |
      | a_valider |
      | valide    |
      | en_attente|
    When I go to the <position> produit's page
    Then I should <action>
    Scenarios:
      | position | action               |
      | first    | see "Initialiser"    |
      | 2nd      | see "Valider"        |
      | 3th      | see "Invalider"      |
      | 4th      | see "Valider"        |

  Scenario: validate a produit
    Given a produit exists with state: "a_valider"
    When I go to that produit's page
      And I follow "Valider"
    Then I should be on that produit's page
      And I should see "valide"
      And I should see the validation date

  Scenario Outline: show a link to update validation date for valide produits
    Given the following produits exist
      | state     | validation_date |
      | brouillon |                 |
      | a_valider |                 |
      | valide    | 2008/12/07      |
      | en_attente|                 |
    When I go to the <position> produit's page
    Then I should <action> "Mettre à jour"
    Scenarios:
      | position | action   |
      | first    | not see  |
      | 2nd      | not see  |
      | 3th      | see      |
      | 4th      | not see  |

  Scenario: show validation date for valid produits
    Given a produit exists with state: "valide"
    When I go to that produit's page
    Then I should see the validation date

  Scenario: hide update validation date link when it's been done today
    Given a produit exists which has been validated today
    When I go to that produit's page
    Then I should not see "Mettre à jour"

  Scenario: update validation date
    Given a produit exists with validation_date: "2008-12-7", state: "valide"
    When I go to that produit's page
      And I follow "Mettre à jour"
    Then I should see "La date de validation a été mise à jour avec succès."
    Then I should see the validation date
