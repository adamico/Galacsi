@wip
Feature: search for fiches by multiple criteria
  In order to know if drugs may be taken while breastfeeding
  As a guest
  I want to search for fiches by different criteria

  Scenario Outline: guests search dcis by name
    Given the following dcis exist
      | name         |
      | lamotrigine  |
      | azathioprine |
      | amoxicilline |
      | tartampionat |
      | castorama    |
      | blablabla    |
      | acétylsalicylique (acide)|
    When I go to the search page
      And I fill in the search form with "<pattern>"
      And I press "Ok"
    Then I should see "<count_result>"
    Scenarios:
      | pattern | count_result    |
      | ine     | 3 résultats     |
      | lam     | 1 résultat      |
      | tar     | 1 résultat      |
      | cas     | 1 résultat      |
      | ace     | 1 résultat      |
      | acé     | 1 résultat      |

  Scenario: search dci or specialite by name
    Given a specialite exists with name: "aspirine"
      And a dci exists
      And a composition exists with specialite: the specialite, dci: the dci
      And another dci exists with name: "aspartame"
    When I go to the search page
      And I fill in the search form with "asp"
      And I press "Ok"
    Then I should see "2 résultats"

  Scenario: search by classe therapeutique belonging
    Given a classe_therapeutique exists with name: "analgésique"
      And a dci exists
      And a classification exists with classe_therapeutique: the classe_therapeutique, dci: the dci
    When I go to the search page
      And I fill in the search form with "ana"
      And I press "Ok"
    Then I should see "1 résultat"
