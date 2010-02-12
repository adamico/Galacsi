Feature: viewing a fiche
  In order to get correct info on drugs use during breastfeeding
  As a guest
  I want to get detailed informations on fiches

  Background:
    Given a dci exists

  Scenario: show validation date as "informations validées le"
    Given a fiche exists with dci: the dci, state: "valide", validation_date: "#{Time.now.to_date}"
    When I go to the dci's fiche page
    Then I should see "Informations validées il y a"
      And I should see when it's been updated last
      But I should not see "MAJ le"

  Scenario: hide validation field for guest users
    Given a dci exists
      And a fiche exists with dci: the dci, state: "brouillon"
    When I go to the dci's fiche page
    Then I should not see "Validation"

  @wip
  Scenario: add relationships to fiches

  @wip
  Scenario: show brief intro for fiche

  @wip
  Scenario: show detailed decision for fiche
