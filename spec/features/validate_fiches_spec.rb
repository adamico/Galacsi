require 'rails_helper'

feature 'Validate fiches' do
  #In order to quickly access non validated fiches
  #As a valideur
  #I want to list fiches without opening dcis and filter them by state
  #and validate/invalidate them
  delegate :t, to: I18n
  given!(:user) { login(create(:valideur)) }
  given(:dci1) { create(:dci) }
  given(:dci2) { create(:dci) }
  given(:dci3) { create(:dci) }
  given(:distinction1) { create(:distinction, name: 'Voie') }
  given(:distinction2) { create(:distinction, name: 'Indication') }
  given!(:fiche1) { create(:fiche, dci: dci1, distinction: distinction1, distinction_name: 'Orale', state: 'brouillon') }
  given!(:fiche2) { create(:fiche, dci: dci1, distinction: distinction1, distinction_name: 'IV', state: 'brouillon') }
  given!(:fiche3) { create(:fiche, dci: dci2, distinction: distinction2, distinction_name: 'Cardiologie', state: 'a_valider') }
  given!(:fiche4) { create(:fiche, dci: dci3, distinction: distinction2, distinction_name: 'Antalgique', state: 'a_valider') }

  background do
    visit fiches_path
  end

  scenario 'show list of all fiches when no filter' do
    expect(page).to have_content('Voie : Orale')
    expect(page).to have_content('Voie : Iv')
    expect(page).to have_content('Indication : Cardiologie')
    expect(page).to have_content('Indication : Antalgique')
  end

  scenario 'filter fiches by state' do
    select 'brouillon', from: 'q_state_eq'
    click_on 'OK'
    expect(page).to have_content('Voie : Orale')
    expect(page).to have_content('Voie : Iv')
  end

  scenario 'valider fiche' do
    within "#details_fiche_#{fiche4.id}" do
      click_on 'Valider'
    end
    click_on 'Mettre en attent'
    expect(page).to have_content('En attente')
    click_on 'Valider'
    expect(page).to have_content('Valide')
  end

  #Scenario: show publication date for published fiches
    #Given a dci exists
      #And a fiche exists with dci: the dci
    #When I validate the fiche
      #And I go to the dci's fiche page
    #Then I should see today as the publication date

  #Scenario: warn if fiches are expired
    #Given a dci exists
      #And a fiche_expiree exists with dci: the dci
    #When I go to the dci's page
    #Then I should see "Fiche expirée !"
      #And I should see the "Revalider" button

  #Scenario: update validation date
    #Given a dci exists
    #And a fiche_expiree exists with dci: the dci
    #When I go to the dci's page
      #And I press "Revalider"
    #Then I should see today as the publication date

  #Scenario: show validation date for valid fiches
    #Given a dci exists
      #And a fiche exists with dci: the dci
    #When I validate the fiche
      #And I go to the dci's page
    #Then I should see today as the publication date

  #Scenario: hide update validation date link when it's been done today
    #Given a dci exists
      #And a fiche exists with dci: the dci
    #When I validate the fiche
      #And I go to the dci's fiche page
    #Then I should not see "Revalider"

  #Scenario: update validation date
    #Given a dci exists
    #And a fiche_expiree exists with dci: the dci, revalider_le: "2009-01-01"
    #When I go to the dci's fiche page
      #And I press "Revalider"
    #Then I should see today as the publication date
      #And I should see "À revalider le :"

  #Scenario: show expired validation fiches
    #Given a dci exists
      #And another dci exists with name: "questa"
      #And a distinction exist with name: "indication"
      #And a fiche_expiree exists with published_at: "2009-01-01", dci: the 2nd dci, distinction: the distinction, distinction_name: "nuova"
    #When I go to the homepage
    #Then I should see "Attention vous avez 1 fiche à vérifier"
      #And I should see "Questa - Indication : Nuova"
      #And I should see "dernière validation le 01/01/2009"

  #Scenario: show link to expired validation fiches
    #Given a dci exists
      #And another dci exists with name: "questa"
      #And a distinction exist with name: "indication"
      #And a fiche_expiree exists with dci: the 2nd dci, published_at: "2009-01-01", distinction: the distinction, distinction_name: "nuova"
      #And I go to the homepage
    #When I follow "Questa - Indication : Nuova"
    #Then I should see "Questa"
    #And I should see "Indication : Nuova"

  #Scenario: hide link to expired validation fiches for guests
    #Given I am not authenticated
    #And a dci exists
    #And another dci exists with name: "questa"
    #And a distinction exist with name: "indication"
    #And a fiche exists with dci: the 2nd dci, revalider_le: "2010-2-11", distinction: the distinction, distinction_name: "nuova"
    #When I go to the homepage
    #Then I should not see "Attention vous avez : 1 fiche à vérifier"
end
