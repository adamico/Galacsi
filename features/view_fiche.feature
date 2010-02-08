Feature: viewing a fiche
  In order to get correct info on drugs use during breastfeeding
  As a guest
  I want to get detailed informations on fiches

  Scenario: show validation date as "informations validées le"
    Given I have a validated fiche
    When I walk to its page
    Then I should see "Informations validées il y a"
      And I should see when it's been updated last
      But I should not see "MAJ le"

  Scenario: show fiche name as title helper
    Given a fiche exists with state: "valide", name: "tartampion"
    When I go to the fiche's page
    Then I should see "Tartampion" within "h1"

  Scenario: show free text description for fiche if non guest
    Given a fiche exists with state: "valide", commentaire: "blabla"
      And I am logged in as a contributeur
    When I go to the fiche's page
    Then I should see "blabla" within ".comment"

  Scenario: hide commentaire field for guest users
    Given a fiche exists with state: "valide", commentaire: "blabla"
    When I go to the fiche's page
    Then I should not see "Commentaire"

  Scenario: add relationships to fiches

  Scenario: show brief intro for fiche

  Scenario: show detailed decision for fiche
