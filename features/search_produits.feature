Feature: search for produits by multiple criteria
  In order to know if drugs may be taken while breastfeeding
  As a user
  I want to search for produits by different criteria

  Background:
    Given the following produits exist
      | name         | validation |
      | lamotrigine  | 1          |
      | azathioprine | 1          |
      | amoxicilline | 1          |
      | tartampionat | 0          |
      | castorama    | 0          |

  Scenario Outline: search validated produit by name
    When I go to the homepage
      And I fill in "search[name_like]" with "<pattern>"
      And I press "Rechercher"
    Then I should see "<count> résultats"
    Scenarios:
      | pattern | count |
      | ine     | 3     |
      | lam     | 1     |
      | tar     | 0     |
      | cas     | 0     |
