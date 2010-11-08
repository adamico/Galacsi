Feature: searching dcis 
  In order to quickly found fiches
  As a user
  I want to search dcis by name or specialite

  Background:
    Given a home_page exists
      And 4 dcis exist
      And 4 specialites exist
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
      And 3 distinctions exist
      And the following fiches exist:
        | dci           | distinction           | distinction_name | state     |
        | the first dci | the first distinction | dn1              | valide    |
        | the first dci | the first distinction | dn2              | brouillon |
        | the 2nd dci   | the 2nd distinction   | dn3              | a_valider |
        | the 2nd dci   | the 2nd distinction   | dn4              | a_valider |
        | the 3rd dci   | the 3rd distinction   | dn5              | valide    |
        | the 4th dci   | the 3rd distinction   | dn6              | en_attente|

  Scenario Outline: unfructuous search
    When I go to the search page
      And I fill in "<search field>" with "<value>"
      And I press "OK"
    Then I should see "Aucun résultat pour '<value>' dans les noms de <search type>"
    Examples:
      | search field       | value| search type |
      | Par principe actif | bla  | DCI         |
      | Par spécialité     | bla  | SPECIALITE  |

  Scenario: unauth users should only see dcis with valid fiches
    When I go to the search page
    And I press "OK"
    Then I should see the following search result:
      | DCI     | Spécialité(s) | Classe(s) Thérapeutique(s)|
      | Dci9    | Specialite9   | Classe5                   |
      | Dci11   | Specialite11  | Classe6                   |
