Given(/^I have no dcis$/) do
  Dci.destroy_all
  Dci.all.should be_empty
end

Then(/^I should see the following dcis:$/) do |expected_table|
  actual_table = table(tableish('table#list tr', 'th,td'))
  actual_table.map_column!('Fiche(s)') {|text| text.gsub(/\n/, ' ')}
  puts "\nactual table :\n" + actual_table.hashes.inspect
  puts "\nexpected table: \n" + expected_table.hashes.inspect
  expected_table.diff!(actual_table)
end

Then(/^I should see the following search results:$/) do |expected_table|
  actual_table = table(tableish('table#list tr', 'th,td'))
  puts "\nactual table :\n" + actual_table.hashes.inspect
  puts "\nexpected table: \n" + expected_table.hashes.inspect
  expected_table.diff!(actual_table)
end
