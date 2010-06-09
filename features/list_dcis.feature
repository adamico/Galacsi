Feature: list dcis according to permissions
  In order to show correct information for drug use during breastfeeding
  As a user
  I want to list dcis according to user permissions

  Background:
    Given a dci exists with name: "thefirst"
    And another dci exists with name: "the2nd"
    And another dci exists with name: "the3rd"
    And another dci exists with name: "the4th"
    Given the following distinctions exist:
      | name |
      | d1   |
      | d2   |
      | d3   |
    And the following fiches exist:
      | dci           | distinction           | distinction_name | state     |
      | the first dci | the first distinction | dist1            | valide    |
      | the first dci | the first distinction | dist2            | brouillon |
      | the 2nd dci   | the 2nd distinction   | dist3            | a_valider |
      | the 2nd dci   | the 2nd distinction   | dist4            | a_valider |
      | the 3rd dci   | the 3rd distinction   | dist5            | valide    |
      | the 4th dci   | the 3rd distinction   | dist6            | en_attente|

  Scenario: hide fiches link if dci has one fiche only
    When I go to the dcis page
    Then I should see "The3rd"
    But I should not see "dist5"

  Scenario: hide fiches non valide link for guests
    When I go to the dcis page
    Then I should see "Thefirst"
    And I should see "dist1"
    But I should not see "dist2"
    
  Scenario: hide fiches state for guests
    When I go to the dcis page
    Then I should not see "valide"
    Then I should not see "brouillon"
    Then I should not see "a_valider"
    Then I should not see "en_attente"
    
  Scenario: a guest should only see dcis with validated fiches
    When I go to the dcis page
    Then I should see "Thefirst"
    But I should not see "The2nd"

  Scenario: auth users should see any kind of fiches
    Given I am logged in as a contributeur
    When I go to the dcis page
    Then I should see "Thefirst"
    And I should see "dist1"
    And I should see "dist2"
    And I should see "The2nd"
    And I should see "dist3"
    And I should see "dist4"
