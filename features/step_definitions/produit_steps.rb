When(/a validated produit$/) do
  @produit = Factory(:produit,
                    :state => "valide",
                    :validation_date => "#{Time.now.to_date}")
end

When(/(\d+) validated produits$/) do |number|
  Then "#{number} produits exist with state: \"valide\""
end

When(/I should have (\d+) validated produit$/) do |number|
  Then "#{number} produits should exist with state: \"valide\""
end

Given(/^I don't have any produits$/) do
  Produit.destroy_all
end

When(/^a produit exists which has been validated today$/) do
  Then "a produit exists with state: \"valide\", validation_date: \"#{Time.now.to_date}\""
end

When(/(.*) the validation date$/) do |action|
  Then "#{action} \"#{Time.now.strftime("%d/%m/%Y")}\""
end

When(/see when it's been updated last$/) do
  response.should contain("#{time_ago_in_words(@produit.validation_date)}")
end

When(/^I walk to its page$/) do
  visit produit_path(@produit)
end
