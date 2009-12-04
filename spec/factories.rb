Factory.define(:produit) do |p|
  p.sequence(:name) {|n| "produit#{n}" }
  #p.validation '0'
  p.state 'brouillon'
end

Factory.define(:user) do |u|
  u.username "fred"
  u.email { |a| "#{a.username}@example.com".downcase }
  u.password "secret"
  u.password_confirmation { |user| user.password }
  u.roles {|roles| [roles.association(:role)]}
end

Factory.define(:role) do |r|
  r.name "contributeur"
end

