Feature: browse dcis according to permissions
  In order to show correct information for drug use during breastfeeding
  As a user
  I want to browse dcis according to user permissions

  Background:
    Given a dci exists

  @wip
  Scenario: a guest visiting /dcis/ should see dcis with validated fiches only
    Given a distinction exists with name: "indication"
      And the following fiches exist:
        | dci     | state     | distinction     | distinction_name |
        | the dci | valide    | the distinction | hta              |
        | the dci | brouillon | the distinction | glaucome         |
        | the dci | a_valider | the distinction | autre            |
    When I go to the dcis page

  @wip
  Scenario: show validation date
    Given a fiche exists with dci: the dci, state: "valide", validation_date: "#{today}"
    When I go to the dci page
    Then the validation date should be today

  Scenario: hide validation field for guest users
    Given a fiche exists with dci: the dci, state: "brouillon"
    When I go to the dci page
    Then I should not see "Validation"

  @wip
  Scenario: show detailed decision for fiche
