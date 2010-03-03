Feature: contribute fiches
  In order to assess drugs safety during breastfeeding
  As an authorized user
  I want to be able to create fiches

  Scenario: a contributeur owns fiches he creates
    Given I am logged in as a contributeur
      And a dci exists
    When I go to the dci page
      And I follow "Rajouter une fiche"
      And I submit
    Then a fiche should exist with user: the user

  @broken
  Scenario: a contributeur can only edit his own fiches
    Given I am logged in as a contributeur
      And another user exists
      And a dci exists
      And the following fiches exist:
        |  dci    | user          |
        | the dci | the 2nd user  |
    When I go to the dci's fiche's page
    Then I should not see "Modifier cette fiche"

  Scenario Outline: show edit link unless "valide" or "en_attente"
    Given I am logged in as a contributeur
      And a dci exists
      And a fiche exists with dci: the dci, state: "<state>"
    When I go to the dci's fiche page
    Then I should <action> "Modifier"
    Examples:
      | state     | action  |
      | brouillon | see     |
      | a_valider | see     |
      | valide    | not see |
      | en_attente| not see |

  Scenario: push "brouillon" to "à_valider"
    Given a fiche exists with dci: the dci, state: "brouillon"
    When I go to the dci's fiche page
    Then I should see "Initialiser"

  Scenario Outline: contributeurs shouldn't see "valider" or "invalider" link
    Given a fiche exists with dci: the dci, state: "<state>"
    When I go to the dci's fiche page
    Then I should not see "<action>"
    Examples:
      | state     | action    |
      | a_valider | Valider   |
      | valide    | Invalider |
      | en_attente| Valider   |
