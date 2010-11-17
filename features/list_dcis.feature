Feature: list dcis
  As an authenticated user
  I want to list all dcis with fiches of any state

  Background:
    Given I am logged in as a contributeur
      And the following dcis exist:
        | name |
        | dci1 |
        | dci2 |
        | dci3 |
        | dci4 |
      And the following specialites exist:
        | name |
        | specialite1 |
        | specialite2 |
        | specialite3 |
        | specialite4 |
      And the following classe_therapeutiques exist:
        | name    |
        | classe1 |
        | classe2 |
      And the following compositions exist:
        | dci           | specialite          |
        | the first dci | the first specialite|
        | the 2nd dci   | the 2nd specialite  |
        | the 3rd dci   | the 3rd specialite  |
        | the 4th dci   | the 4th specialite  |
      And the following classifications exist:
        | dci           | classe_therapeutique          |
        | the first dci | the first classe_therapeutique|
        | the 2nd dci   | the first classe_therapeutique|
        | the 3rd dci   | the 2nd classe_therapeutique  |
        | the 4th dci   | the 2nd classe_therapeutique  |
      And the following distinctions exist:
        | name      |
        | Voie      |
        | Indication|
        | Dosage    |
      And the following fiches exist:
        | dci           | distinction           | distinction_name | state     |
        | the first dci | the first distinction | Orale            | valide    |
        | the first dci | the first distinction | IV               | brouillon |
        | the 2nd dci   | the 2nd distinction   | Cardiologie      | a_valider |
        | the 2nd dci   | the 2nd distinction   | Antalgique       | a_valider |
        | the 3rd dci   | the 3rd distinction   | Haut             | valide    |
        | the 4th dci   | the 3rd distinction   | Bas              | en_attente|

  Scenario: warn if no dcis
    Given I have no dcis
    When I go to the dcis page
    Then I should see "Aucune DCI dans la base"

  Scenario: list all dcis
    When I go to the dcis page
    Then I should see the following dcis:
      | DCI | Spécialité(s) | Classe(s) Thérapeutique(s) | Fiche(s) |
      | Dci1| Specialite1   | Classe1                    | 2 (1 non validée)|
      | Dci2| Specialite2   | Classe1                    | 2 (2 non validées)|
      | Dci3| Specialite3   | Classe2                    | 1 |
      | Dci4| Specialite4   | Classe2                    | 1 (1 non validée)|
