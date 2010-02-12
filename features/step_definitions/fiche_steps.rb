def today
  Time.now.to_date
end

When(/^a fiche exists which has been validated today$/) do
  Then "a fiche exists with dci: the dci, state: \"valide\", validation_date: \"#{today}\""
end

When(/(.*) the validation date$/) do |action|
  Then "#{action} \"#{Time.now.strftime("%d/%m/%Y")}\""
end

When(/see when it's been updated last$/) do
  response.should contain("#{time_ago_in_words(today)}")
end
