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
    Then I should see "Thefirst"
      But I should not see "The2nd"

  Scenario: auth users visiting /dcis/ should see dcis names for fiches with any state
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
      And I should see "The2nd"

  Scenario: for guests show message if no dcis has validated fiches
    Given the following fiches exist:
        | dci     | state     |
        | the dci | brouillon |
    When I go to the dcis page
    Then I should see "Aucune DCI n'existe avec des fiches validées."

  Scenario: authenticated users should see list of fiches in dci list
    Given I am logged in as a contributeur
      And another dci exists
      And a distinction exists
      And the following fiches exist:
        | dci           | distinction     | distinction_name | state     |
        | the first dci | the distinction | unaprima         | valide    |
        | the first dci | the distinction | altraprima       | valide    |
        | the 2nd dci   | the distinction | unaseconda       | valide    |
        | the 2nd dci   | the distinction | altraseconda     | valide    |
    When I go to the dcis page
    Then I should see "unaprima"
    Then I should see "altraprima"
    Then I should see "unaseconda"
    Then I should see "altraseconda"

  Scenario: a guest should not see the list of fiches in dci list
    Given another dci exists
      And a distinction exists
      And the following fiches exist:
        | dci           | distinction     | distinction_name | state     |
        | the first dci | the distinction | unaprima         | valide    |
        | the first dci | the distinction | altraprima       | valide    |
        | the 2nd dci   | the distinction | unaseconda       | valide    |
        | the 2nd dci   | the distinction | altraseconda     | valide    |
    When I go to the dcis page
    Then I should not see "unaprima"
    Then I should not see "altraprima"
    Then I should not see "unaseconda"
    Then I should not see "altraseconda"

  Scenario: show validation date
    Given a fiche exists with dci: the dci, state: "valide", validation_date: "#{today}"
    When I go to the dci page
    Then the validation date should be today

  Scenario: hide validation field for guest users
    Given a fiche exists with dci: the dci, state: "brouillon"
    When I go to the dci page
    Then I should not see "Validation"

  @todo
  Scenario: show detailed decision for fiche
