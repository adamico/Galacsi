Factory.define(:produit) do |p|
  p.sequence(:name) {|n| "produit#{n}" }
  p.state 'brouillon'
  p.validation_date "#{Time.now.to_date}"
  p.commentaire 'blabla'
  p.association :decision
end

Factory.define(:decision) do |d|
  d.name "Compatible"
end

Factory.define(:user) do |u|
  u.username "fred"
  u.email { |a| "#{a.username}@example.com".downcase }
  u.password "secret"
  u.password_confirmation { |user| user.password }
  u.role "contributeur"
end
