# encoding: utf-8
When /^I log in as a user in the (.*) role$/ do |role|
  @user = Factory(:user,
                 :username => "user",
                 :password => "password",
                 :password_confirmation => "password",
                 :role => role)
  visit login_url
  fill_in "Utilisateur", :with => "user"
  fill_in "Mot de passe", :with => "password"
  click_button "Se connecter"
  response.body.should =~ /succès/m
end

When /^I walk to the produits page$/ do
  with_user @role do
    visit produits_url
  end
end

When /logged in as an? (.*)$/ do |role|
  Then "I log in as a user in the #{role} role"
end

When /^an (.*)$/ do |role|
  Then "I log in as a user in the #{role} role"
end
