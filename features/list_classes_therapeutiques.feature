Feature: list classes therapeutiques
  In order to unclutter classes therapeutiques lists
  Unauthorised users should not see all c.t.

  Background:
    Given the following classe_therapeutiques exist:
      | name      |
      | classe_nok|
      | classe_ok |
      And 3 dcis exist
      And the following classifications exist
      | classe_therapeutique            | dci           |
      | the first classe_therapeutique  | the first dci |
      | the 2nd classe_therapeutique    | the 2nd dci   |
      | the 2nd classe_therapeutique    | the 3rd dci   |
      And the following fiches exist:
      | dci           | state     |
      | the first dci | brouillon |
      | the 2nd dci   | valide    |
      | the 3rd dci   | valide    |

  Scenario: hide c.t. if dci has no valid fiches and user not auth'd
    Given I am not authenticated
    When I go to the classe_therapeutiques page
    Then I should see "classe_ok"
      But I should not see "classe_nok"

  Scenario: auth users should see all c.t.
    Given I am logged in as a valideur
    When I go to the classe_therapeutiques page
    Then I should see "classe_nok"
      And I should see "classe_ok"

  Scenario: auth users should see dcis number for c.t.
    Given I am logged in as a valideur
    When I go to the classe_therapeutiques page
    Then I should see "classe_ok"
      And I should see "2 dcis"
