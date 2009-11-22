Feature: manage produits
    In order to enter new cases in galacsi
    As the admin
    I want to be able to create and modify produits

    Scenario: create a produit
        Given I am on the homepage
        And I follow "Créer un produit"
        And I fill in "name" with "lamotrigine"
        And I press "Sauvegarder"
        Then I should see "lamotrigine"

    Scenario: update a produit
        Given a produit exists
        When I go to the produit's edit page
        And I fill in "name" with "lamotrigina"
        And I press "Sauvegarder"
        Then I should see "lamotrigina"
