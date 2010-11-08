# encoding: utf-8
Feature: manage classes therapeutiques
  In order to search for dci by classe therapeutique
  As a user of GalacSI
  I want to assign classes therapeutiques
  To DCIs

  Background:
    Given a home_page exists
      And I am logged in as a valideur

  Scenario: adding a classe therapeutique to existing dcis
    Given a dci exists
      And a classe_therapeutique exists with name: "Urologie"
    When I go to the dci's edit page
      And I select "Urologie" from "Classes thérapeutiques"
      And I press "Enregistrer"
    Then I should see "Classes thérapeutiques :"
      And I should see "Urologie"

  Scenario: adding a classe therapeutique to new dcis
    Given a classe_therapeutique exists with name: "Urologie"
    When I go to the new dci page
      And I fill in "Nom" with "lenom"
      And I select "Urologie" from "Classes thérapeutiques"
      And I press "Enregistrer"
    Then I should see "Classes thérapeutiques :"
      And I should see "Urologie"

  Scenario: adding multiple classes therapeutiques
    Given a dci exists
      And the following classe_therapeutiques exist:
        | name       |
        | uneclasse1 |
        | uneclasse2 |
    When I go to the dci's edit page
      And I select "uneclasse1" from "Classes thérapeutiques"
      And I select "uneclasse2" from "Classes thérapeutiques"
      And I press "Enregistrer"
    Then I should see "Classes thérapeutiques :"
      And I should see "Uneclasse1, Uneclasse2"
