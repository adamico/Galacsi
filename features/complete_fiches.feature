Feature: complete a fiche
  In order to feed users correct info about drugs use during breastfeeding
  As a contributeur or valideur
  I want to fill in detailed informations on fiches

  Background:
      Given I am logged in as a contributeur

  Scenario: select "niveau décision"
    Given a dci exists
      And a decision: "compatible" exists
      And a fiche exists with dci: the dci, decision: the decision
    When I go to the dci's fiche page
    Then I should see "Compatible"
