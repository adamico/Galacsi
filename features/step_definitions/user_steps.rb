When /^I log in as a user in the (.*) role$/ do |role|
  @user = Factory(:user,
                 :username => "user",
                 :password => "password",
                 :password_confirmation => "password")
  @role = Factory(:role, :name => role)
  @user.roles << @role
  visit login_url
  fill_in "Utilisateur", :with => "user"
  fill_in "Mot de passe", :with => "password"
  click_button "Se connecter"
  response.body.should =~ /Success/m
end

When /logged in as an? (.*)$/ do |role|
  Then "I log in as a user in the #{role} role"
end

When /be allowed to modify it$/ do
  Then "I should see \"Modifier\""
end

When /non validated produit exists$/ do
  Then "a produit exists with validation: \"0\""
end

When /have 1 validated produit$/ do
  Then "a produit should exist with validation: \"1\""
end

When /(\d+) non validated produits exist$/ do |number|
  Then "#{number} produits exist with validation: \"0\""
end

When /^an (.*)$/ do |role|
  Then "I log in as a user in the #{role} role"
end
