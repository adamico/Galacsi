FactoryGirl.define do
  factory :page do |f|
    f.sequence(:permalink) {|n| "permalink#{n}"}
    f.title "a title"
    f.content "a content"
  end

  factory :home_page, :parent => :page do |f|
    f.permalink "home"
  end

  factory :fiche do |f|
    f.commentaire 'blabla'
    f.distinction_name 'hta'
    f.suivi 'oui'
    f.state 'brouillon'
  end

  factory :fiche_a_valider, :parent => :fiche do |f|
    f.state "a_valider"
  end

  factory :fiche_valide, :parent => :fiche do |f|
    f.state "valide"
    f.published_at Time.now.to_date
    f.revalider_le 3.months.from_now.to_date
  end

  factory :fiche_en_attente, :parent => :fiche do |f|
    f.state "en_attente"
    f.published_at nil
  end

  factory :fiche_expiree, :parent => :fiche_valide do |f|
    f.revalider_le 1.day.ago.to_date
  end

  factory :fiche_recente, :parent => :fiche do |f|
    f.state "valide"
    f.published_at Time.now.to_date
  end

  factory(:distinction) do |f|
    f.sequence(:name) {|n| "dist#{n}"}
  end

  factory :dci do |f|
    f.sequence(:name) {|n| "dci#{n}" }
  end

  factory :decision do |f|
    f.name "Compatible"
  end

  factory :composition do |f|
    f.association :specialite
    f.association :dci
  end

  factory :classification do |f|
    f.association :classe_therapeutique
    f.association :dci
  end

  factory :specialite  do |f|
    f.sequence(:name) {|n| "specialite#{n}"}
  end

  factory :classe_therapeutique do |f|
    f.sequence(:name) { |n| "classe#{n}" }
  end

  factory :user do |f|
    f.sequence(:username) {|n| "username#{n}"}
    f.email { |a| "#{a.username}@example.com".downcase }
    f.password "password"
    f.password_confirmation { |user| user.password }
  end

  factory :valideur, :parent => :user do |f|
    f.role "valideur"
  end

  factory :contributeur, :parent => :user do |f|
    f.role "contributeur"
  end
end
