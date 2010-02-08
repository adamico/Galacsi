Feature: complete a fiche
  In order to feed users correct info about drugs use during breastfeeding
  As a contributeur or valideur
  I want to fill in detailed informations on fiches

  Scenario: select "niveau décision"
    Given a decision: "compatible" exists
    Given a fiche exists with name: "tartampionate de sodium", state: "brouillon"
      And I am logged in as a contributeur
    When I go to the fiche's edit page
      And I select "Compatible" from "Décision"
      And I press "Sauvegarder"
      Then the fiche should be one of decision: "compatible"'s fiches

  Scenario: fill in commentaire
    Given a fiche exists
      And I am logged in as a contributeur
    When I go to the fiche's edit page
      And I fill in "Commentaire" with "lecomment"
      And I press "Sauvegarder"
    Then I should see "lecomment"
