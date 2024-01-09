require 'rails_helper'

RSpec.describe 'Testing Category#new view', type: :feature do
  before(:each) do
    @user = User.create(name: 'Test User', email: 'example@test.com', password: '123456')
  end

  it 'renders the new category form' do
    visit new_user_category_path(@user)

    expect(page).to have_selector('header h2', text: 'ADD CATEGORY')
    expect(page).to have_current_path(new_user_category_path(@user))
    expect(page).to have_field('category_name')
    expect(page).to have_field('category_icon')
    expect(page).to have_button('Save')
  end

  it 'creates a new category when the form is submitted' do
    visit new_user_category_path(@user)

    fill_in 'category_name', with: 'Test Category'
    fill_in 'category_icon', with: 'test-icon'
    click_button 'Save'

    expect(page).to have_content('Category was successfully created.')
    expect(Category.last.name).to eq('Test Category')
    expect(Category.last.icon).to eq('test-icon')
  end
end
