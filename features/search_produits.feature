@search @produits
Feature: search for produits by multiple criteria
  In order to know if drugs may be taken while breastfeeding
  As a user
  I want to search for produits by different criteria

  Background:
    Given the following produits exist
      | name         | state      |
      | lamotrigine  | valide     |
      | azathioprine | valide     |
      | amoxicilline | valide     |
      | tartampionat | a_valider  |
      | castorama    | brouillon  |
      | blablabla    | en_attente |

@guest
  Scenario Outline: guests search produits by name
    When I go to the homepage
      And I fill in "search[name_like]" with "<pattern>"
      And I press "Rechercher"
    Then I should see "<count_result>"
    Scenarios:
      | pattern | count_result                  |
      | ine     | 3 résultats                   |
      | lam     | 1 résultat                    |
      | tar     | Aucun produit n'a été trouvé  |
      | cas     | Aucun produit n'a été trouvé  |

@contributeur @valideur
  Scenario Outline: authenticated users search produits by name
    Given I am logged in as a <role>
    When I go to the homepage
      And I fill in "search[name_like]" with "<pattern>"
      And I press "Rechercher"
    Then I should see "<count_result>"
    Scenarios:
      | role          | pattern | count_result |
      | contributeur  | tar     | 1 résultat   |
      | valideur      | tar     | 1 résultat   |
      | contributeur  | cas     | 1 résultat   |
      | valideur      | cas     | 1 résultat   |
