Feature: browse produits according to permissions
  In order to show correct information for drug use during breastfeeding
  As a user
  I want to show produits according to user permissions

  Background:
    Given the following produits exist
    | name      | state     |
    | brou      | brouillon |
    | aval      | a_valider |
    | vali      | valide    |
    | enat      | en_attente|

  Scenario: show correct message if no produits found
    Given I don't have any produits
    When I go to the produits page
    Then I should see "Aucun produit n'a été trouvé"

  Scenario Outline: show produits list according to user role permissions
    Given I am logged in as a <role>
    When I go to the produits page
    Then I should see "Produits (<count>)"
    Scenarios:
      | role          | count |
      | valideur      | 4     |
      | contributeur  | 4     |

  Scenario: show only validated produits as guest
    When I go to the produits page
    Then I should see "Produits (1)"

  Scenario: hide validation field for guest users
    When I go to the produits page
    Then I should not see "Validation"
      And I should not see "valide"
