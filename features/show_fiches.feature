Feature: show fiches for a dci
  In order to distinguish fiches listing between auth users and not
  As a user
  I want to show associated fiches for a dci

  Background:
    Given a dci exists with name: "thefirst"
    And another dci exists with name: "the2nd"
    And the following fiches exist:
      | dci           | distinction_name | state     |
      | the first dci | dist1            | valide    |
      | the first dci | dist2            | brouillon |
      | the 2nd dci   | dist3            | a_valider |
      | the 2nd dci   | dist4            | a_valider |

  Scenario: a guest should only see validated fiches
    When I go to the first dci page
    Then I should see "Dist1"
    But I should not see "dist2"

  Scenario: hide validation field for guest users
    When I go to the first dci page
    Then I should not see "Validation"
    And I should not see "valide"

  @wip
  Scenario: show validation date
    Given a fiche exists with dci: the dci, state: "valide", validation_date: "#{today}"
    When I go to the dci page
    Then the validation date should be today
