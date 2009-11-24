Factory.define(:produit) do |p|
  p.name 'tartampionate de sodium'
end

Factory.define(:user) do |u|
  u.username "fred"
  u.email { |a| "#{a.username}@example.com".downcase }
  u.password "secret"
  u.password_confirmation { |user| user.password }
end
