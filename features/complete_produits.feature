@focus
Feature: complete a produit
  In order to feed users correct info about drugs use during breastfeeding
  As a contributeur or valideur
  I want to fill in detailed informations on produits

  Scenario: select "niveau décision"
    Given a decision: "compatible" exists
    Given a produit exists with name: "tartampionate de sodium", state: "brouillon"
      And I am logged in as a contributeur
    When I go to the produit's edit page
      And I select "Compatible" from "Décision"
      And I press "Sauvegarder"
      Then the produit should be one of decision: "compatible"'s produits

  Scenario: fill in commentaire
    Given a produit exists
      And I am logged in as a contributeur
    When I go to the produit's edit page
      And I fill in "Commentaire" with "lecomment"
      And I press "Sauvegarder"
    Then I should see "lecomment"
    
      
