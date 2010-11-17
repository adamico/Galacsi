Feature: user besides guest must authenticate
  In order to restrict write access to authorized users
  A user
  Should authenticate themselves to the application

  Scenario Outline: user tries to authenticate
    Given a user exists with username: "myuser", password: "mypass"
    When they visit the user authentication page
      And they enter the user_username "<username>"
      And they enter the user_password "<password>"
      And they press the authenticate button
    Then they should <expectation> an authentication success message
    Examples:
      | username  | password  | expectation |
      | myuser    | mypass    | see         |
      | tizio     | pass      | not see     |

  Scenario Outline: log in
    When I am logged in as a <role>
    Then I should see "Déconnexion"
    Examples:
      | role   |
      | contributeur |
      | valideur |

  Scenario: log out
    Given I am logged in as a contributeur
    When I signout
    Then I should see "Déconnexion effectuée avec succès."
      And I should see "Connexion"
