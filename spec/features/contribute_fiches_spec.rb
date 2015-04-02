require 'rails_helper'

feature 'contribute fiches' do
  #In order to assess drugs safety during breastfeeding
  #As an authorized user
  #I want to be able to create fiches
  delegate :t, to: I18n
  given!(:user) { login create(:contributeur) }
  given!(:dci)  { create(:dci) }

  scenario 'a contributeur owns fiches he creates' do
    visit dci_path(dci)
    click_on t('create_fiche', scope: 'dcis.show')
    click_on t('helpers.submit.create', model: 'Fiche')
    expect(Fiche.exists?(user: user)).to be_truthy
  end

  scenario 'create a fiche with alternatives' do
    visit dci_path(dci)
    click_on t('create_fiche', scope: 'dcis.show')
    fill_in 'fiche_alternative_names', with: 'desloratadine, cétirizine'
    click_on t('helpers.submit.create', model: 'Fiche')
    expect(Fiche.last.alternative_names).to eq('desloratadine, cétirizine')
  end

  scenario 'a contributeur can only edit his own fiches' do
    create(:fiche, dci: dci, user: create(:contributeur))
    visit dci_path(dci)
    expect(page).not_to have_content(t('edit', model: 'FICHE'))
  end

  describe 'show or hide edit link' do
    given!(:fiche) { create(:fiche, dci: dci, user: user) }

    scenario 'shows edit link when fiche state is "brouillon"' do
      visit dci_path(dci)
      expect(page).to have_link(t('edit', model: 'FICHE'))
    end

    scenario 'shows edit link when fiche state is "a_valider"' do
      fiche.initialiser!
      visit dci_path(dci)
      expect(page).to have_link(t('edit', model: 'FICHE'))
    end

    scenario 'hides edit link when fiche state is "valide"' do
      fiche.initialiser!
      fiche.valider!
      visit dci_path(dci)
      expect(page).not_to have_link(t('edit', model: 'FICHE'))
    end

    scenario 'hides edit link when fiche state is "en_attente"' do
      fiche.initialiser!
      fiche.valider!
      fiche.mettre_en_attente!
      visit dci_path(dci)
      expect(page).not_to have_link(t('edit', model: 'FICHE'))
    end
  end

  scenario 'push "brouillon" to "à_valider"' do
    create(:fiche, dci: dci, user: user)
    visit dci_path(dci)
    expect(page).to have_button('Initialiser')
  end

  describe 'show or hide "valider" or "invalider" link' do
    given!(:fiche) { create(:fiche, dci: dci, user: user, state: 'a_valider') }

    scenario 'hide "Valider" link when fiche state is "a_valider"' do
      visit dci_path(dci)
      expect(page).not_to have_button('Valider')
    end

    scenario 'hide "Mettre en attente" link when fiche state is "valide"' do
      fiche.valider!
      visit dci_path(dci)
      expect(page).not_to have_button('Mettre en attente')
    end

    scenario 'hide "Valider" link when fiche state is "en_attente"' do
      fiche.valider!
      fiche.mettre_en_attente!
      visit dci_path(dci)
      expect(page).not_to have_button('Valider')
    end
  end
end
