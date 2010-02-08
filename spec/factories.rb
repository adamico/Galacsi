Factory.define :fiche do |p|
  p.sequence(:name) {|n| "fiche#{n}" }
  p.state 'brouillon'
  p.validation_date "#{Time.now.to_date}"
  p.commentaire 'blabla'
  p.association :decision
end

Factory.define :decision do |d|
  d.name "Compatible"
end

Factory.define :user do |u|
  u.sequence(:username) {|n| "user#{n}"}
  u.email { |a| "#{a.username}@example.com".downcase }
  u.password "secret"
  u.password_confirmation { |user| user.password }
  u.role "contributeur"
end

Factory.define :admin, :parent => :user do |a|
  a.role "admin"
end

Factory.define :valideur, :parent => :user do |v|
  v.role "valideur"
end

Factory.define :contributeur, :parent => :user do |c|
  c.role "contributeur"
end