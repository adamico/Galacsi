@produits
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
