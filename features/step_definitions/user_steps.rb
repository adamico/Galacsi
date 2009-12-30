# encoding: utf-8
When(/^I log in as a user in the (.*) role$/) do |role|
  a_user = Factory(:user, :role => role.to_s)
  visit login_url
  fill_in "Utilisateur", :with => a_user.username
  fill_in "Mot de passe", :with => a_user.password
  click_button "Se connecter"
  response.body.should =~ /succès/m
end

When(/logged in as an? (.*)$/) do |role|
  Then "I log in as a user in the #{role} role"
end

When(/^an (.*)$/) do |role|
  Then "I log in as a user in the #{role} role"
end
