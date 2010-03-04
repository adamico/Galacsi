# encoding: utf-8
When(/^I log in as a user in the (.*) role$/) do |role|
  steps %Q{
    Given a user exists with role: "#{role}", username: "username", password: "password"
    When I go to the login page
      And I fill in "Utilisateur" with "username"
      And I fill in "Mot de passe" with "password"
    Given I press "Se connecter"
    Then I should see "succès"
  }
end

When(/logged in as an? (.*)$/) do |role|
  Then "I log in as a user in the #{role} role"
end
