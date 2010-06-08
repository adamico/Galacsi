@wip
Feature: browse dcis according to permissions
  In order to show correct information for drug use during breastfeeding
  As a user
  I want to browse dcis according to user permissions

  Background:
    Given a dci exists with name: "thefirst"

  Scenario: a guest visiting /dcis/ should see dcis with validated fiches only
    Given another dci exists with name: "the2nd"
      And the following fiches exist:
        | dci           | state     |
        | the first dci | valide    |
        | the first dci | brouillon |
        | the 2nd dci   | a_valider |
        | the 2nd dci   | a_valider |
    When I go to the dcis page
    Then show me the page
    Then I should see "Thefirst"
      But I should not see "The2nd"

  Scenario: auth users visiting /dcis/ should see any kind of fiches
    Given I am logged in as a contributeur
      And another dci exists with name: "the2nd"
      And the following fiches exist:
        | dci           | state     |
        | the first dci | valide    |
        | the first dci | brouillon |
        | the 2nd dci   | a_valider |
        | the 2nd dci   | a_valider |
    When I go to the dcis page
    Then I should see "Thefirst"
      And I should see "Fiches validées (1)"
      And I should see "Fiches non validées (1)"
      And I should see "The2nd"
      And I should see "Pas de fiches validées"
      And I should see "Fiches non validées (2)"

  Scenario: show validation date
    Given a fiche exists with dci: the dci, state: "valide", validation_date: "#{today}"
    When I go to the dci page
    Then the validation date should be today

  Scenario: hide validation field for guest users
    Given a fiche exists with dci: the dci, state: "brouillon"
    When I go to the dci page
    Then I should not see "Validation"
    And I should not see "brouillon"
