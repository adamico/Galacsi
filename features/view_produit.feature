Feature: viewing a produit
  In order to get correct info on drugs use during breastfeeding
  As a guest
  I want to get detailed informations on produits

  Scenario: show validation date as "informations validées le"
    Given I have a validated produit
    When I walk to its page
    Then I should see "Informations validées il y a"
      And I should see when it's been updated last
      But I should not see "MAJ le"

  Scenario: show produit name as title helper
    Given a produit exists with state: "valide", name: "tartampion"
    When I go to the produit's page
    Then I should see "Tartampion" within "h1"

  Scenario: show free text description for produit if non guest
    Given a produit exists with state: "valide", commentaire: "blabla"
      And I am logged in as a contributeur
    When I go to the produit's page
    Then I should see "blabla" within ".comment"

  Scenario: hide commentaire field for guest users
    Given a produit exists with state: "valide", commentaire: "blabla"
    When I go to the produit's page
    Then I should not see "Commentaire"

  Scenario: add relationships to produits

  Scenario: show brief intro for produit

  Scenario: show detailed decision for produit
