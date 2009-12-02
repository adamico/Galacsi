When /a non validated produit$/ do
  Then "a produit exists with validation: \"0\""
end

When /(\d+) non validated produits$/ do |number|
  Then "#{number} produits exist with validation: \"0\""
end

When /a validated produit$/ do
  Then "a produit exists with validation: \"1\""
end

When /(\d+) validated produits$/ do |number|
  Then "#{number} produits exist with validation: \"1\""
end

When /I should have (\d+) validated produit$/ do |number|
  Then "#{number} produits should exist with validation: \"1\""
end

When /I should have (\d+) nonvalidated produits$/ do |number|
  Then "#{number} produits should exist with validation: \"0\""
end
