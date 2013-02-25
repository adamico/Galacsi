FactoryGirl.define do
  factory :page do
    sequence(:permalink) {|n| "permalink#{n}"}
    title "a title"
    content "a content"
  end

  factory :home_page, :parent => :page do
    permalink "home"
  end

  factory :fiche do
    commentaire 'blabla'
    distinction_name 'hta'
    suivi 'oui'
    state 'brouillon'
  end

	factory :fiche_a_valider, :parent => :fiche do
  	state "a_valider"
  end

	factory :fiche_valide, :parent => :fiche do
  	state "valide"
  	published_at Time.now.to_date
  	revalider_le 3.months.from_now.to_date
  end

	factory :fiche_en_attente, :parent => :fiche do
  	state "en_attente"
  	published_at nil
  end

	factory :fiche_expiree, :parent => :fiche_valide do
  	revalider_le 1.day.ago.to_date
	end

	factory :fiche_recente, :parent => :fiche do
  	state "valide"
  	published_at Time.now.to_date
	end

	factory(:distinction) do
  	sequence(:name) {|n| "dist#{n}"}
	end

	factory :dci do
  	sequence(:name) {|n| "dci#{n}" }
	end

	factory :decision do
  	name "Compatible"
	end

	factory :composition do
  	association :specialite
  	association :dci
	end

	factory :classification do
  	association :classe_therapeutique
  	association :dci
	end

	factory :specialite  do
  	sequence(:name) {|n| "specialite#{n}"}
	end

	factory :classe_therapeutique do
  	sequence(:name) { |n| "classe#{n}" }
	end

	factory :user do
  	sequence(:username) {|n| "username#{n}"}
  	email { |a| "#{a.username}@example.com".downcase }
  	password "password"
  	password_confirmation { |user| user.password }
	end

	factory :valideur, :parent => :user do
  	role "valideur"
	end

	factory :contributeur, :parent => :user do
  	role "contributeur"
	end
end
