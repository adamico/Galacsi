Feature: searching dcis 
  In order to quickly found fiches
  As a user
  I want to search dcis by name or specialite

  Background:
    Given the following dcis exist:
      | name |
      | dci 1 |
      | dci 2 |
      | dci 3 |
      | dci 4 |
      And the following specialites exist:
        | name |
        | specialite |
        | specialite 2 |
        | specialite 3 |
        | specialite 4 |
      And 2 classe_therapeutiques exist
      And the following compositions exist:
        | dci           | specialite          |
        | the first dci | the first specialite|
        | the 2nd dci   | the 2nd specialite  |
        | the 3rd dci   | the 3rd specialite  |
        | the 4th dci   | the 4th specialite  |
      And the following classifications exist:
        | dci           | classe_therapeutique          |
        | the first dci | the first classe_therapeutique|
        | the 2nd dci   | the first classe_therapeutique|
        | the 3rd dci   | the 2nd classe_therapeutique  |
        | the 4th dci   | the 2nd classe_therapeutique  |
      And the following distinctions exist:
        | name      |
        | Voie      |
        | Indication|
        | Dosage    |
      And the following fiches exist:
        | dci           | distinction           | distinction_name | state     |
        | the first dci | the first distinction | Orale            | valide    |
        | the first dci | the first distinction | IV               | brouillon |
        | the 2nd dci   | the 2nd distinction   | Cardiologie      | a_valider |
        | the 2nd dci   | the 2nd distinction   | Antalgique       | a_valider |
        | the 3rd dci   | the 3rd distinction   | Haut             | valide    |
        | the 4th dci   | the 3rd distinction   | Bas              | en_attente|

  Scenario Outline: unfructuous search
    When I go to the search page
      And I fill in "<field>" with "<value>"
      And I press "OK"
    Then I should see "Aucun résultat pour '<value>' dans les noms de <type>"
    Examples:
      | field              | value| type        |
      | Par principe actif | bla  | DCI         |
      | Par spécialité     | bla  | spécialité  |

  Scenario: search fields must be exact results
    When I go to the search page
      And I fill in "Par principe actif" with "dci"
      And I press "OK"
    Then I should see "Aucun résultat pour 'dci' dans les noms de DCI"

  Scenario: unauth users can only see valid fiches
    When I go to the search page
    And I press "OK"
    Then I should see "2 résultats"
      And I should see the following search results:
        | Dci 1 Voie : Orale |
        | Dci 3 Dosage : Haut|
