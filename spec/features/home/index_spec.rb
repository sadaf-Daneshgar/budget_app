require 'rails_helper'

RSpec.feature 'HomePage', type: :feature do
  scenario 'visitor sees the Snapscan header and login/signup links' do
    visit root_path

    expect(page).to have_css('div.budget h1', text: 'Snapscan 📲')
    expect(page).to have_link('LOGIN', href: new_user_session_path)
    expect(page).to have_link('SIGN UP', href: new_user_registration_path)
  end
end
