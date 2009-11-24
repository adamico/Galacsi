Given /^I am logged in as a user in the (.*) role$/ do |role|
  @user = Factory(:user,
                 :username => "user",
                 :password => "password",
                 :password_confirmation => "password")
  @role = Factory(:role, :name => role)
  @user.roles << @role
  visit login_url
  fill_in "Username", :with => "user"
  fill_in "Password", :with => "password"
  click_button "Log in"
  response.body.should =~ /Success/m
end
