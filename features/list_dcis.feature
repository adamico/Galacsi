Feature: list dcis according to permissions
  In order to show correct information for drug use during breastfeeding
  As a user
  I want to list dcis according to user permissions

  Background:
    Given a dci exists with name: "thefirst"
    And another dci exists with name: "the2nd"
    And the following fiches exist:
      | dci           | distinction_name | state     |
      | the first dci | dist1            | valide    |
      | the first dci | dist2            | brouillon |
      | the 2nd dci   | dist3            | a_valider |
      | the 2nd dci   | dist4            | a_valider |

  Scenario: a guest should only see dcis with validated fiches
    When I go to the dcis page
    Then I should see "Thefirst"
    But I should not see "The2nd"

  Scenario: a guest should only see validated fiches
    When I go to the first dci page
    Then I should see "dist1"
    But I should not see "dist2"

  Scenario: auth users should see any kind of fiches
    Given I am logged in as a contributeur
    When I go to the dcis page
    Then I should see "Thefirst"
    And I should see "dist1"
    And I should see "dist2"
    And I should see "The2nd"
    And I should see "dist3"
    And I should see "dist4"
