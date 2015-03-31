require 'rails_helper'

feature 'User besides guests must authenticate' do
  delegate :t, :l, to: I18n

  given(:user) { create(:user) }

  background do
    visit root_path
    click_on t('application.nav.login')
  end

  describe 'logs in with correct credentials' do
    background do
      fill_in 'user_username', with: user.username
      fill_in 'user_password', with: user.password
      click_on t('devise.sessions.new.submit')
    end

    scenario 'sees a success message' do
      expect(page).to have_content(t('devise.sessions.signed_in'))
    end

    scenario 'can log out' do
      click_on t('application.nav.logout')
      expect(page).to have_link(t('application.nav.login'))
    end
  end

  describe 'tries to log in with' do
    scenario 'non existent username' do
      fill_in 'user_username', with: 'foobarlon'
      fill_in 'user_password', with: 'passworlon'
      click_on t('devise.sessions.new.submit')
      expect(page).to have_content(t('devise.failure.not_found_in_database',
                                      authentication_keys: 'username'))
    end

    scenario 'invalid password' do
      fill_in 'user_username', with: user.username
      fill_in 'user_password', with: 'wrongpassword'
      click_on t('devise.sessions.new.submit')
      expect(page).to have_content(t('devise.failure.invalid',
                                     authentication_keys: 'username'))
    end
  end
end
