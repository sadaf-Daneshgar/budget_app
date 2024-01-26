require 'rails_helper'

RSpec.describe 'Testing Category#index view', type: :feature do
  before(:each) do
    @user = User.create(name: 'Test User', email: 'example@test.com', password: '123456')
    @categories = [
      Category.create(name: 'Category 1', icon: 'icon1', user: @user),
      Category.create(name: 'Category 2', icon: 'icon2', user: @user)
    ]
    Expense.create(category: @categories[0], amount: 100, created_at: Time.now - 1.day)
    Expense.create(category: @categories[0], amount: 150, created_at: Time.now)
    Expense.create(category: @categories[1], amount: 200, created_at: Time.now)
  end

  it 'renders the category list with correct information' do
    visit user_categories_path(@user)

    expect(page).to have_selector('header h2', text: 'CATEGORIES 📁')
    expect(page).to have_selector('header i.fa.fa-search')
    expect(page).to have_selector('.category-list')

    @categories.each do |category|
      expect(page).to have_selector('.category-link', count: @categories.length)

      within(".category-link[href='#{user_category_expenses_path(@user, category)}']") do
        expect(page).to have_selector(".category-icon img[src=\"#{category.icon}\"]")
        expect(page).to have_selector('.category p', text: category.name)
        expect(page).to have_selector('.category p.expense-date', text: category.created_at.strftime('%m/%d/%Y'))
        expect(page).to have_selector('.amount p', text: number_to_currency(category.expenses.sum(:amount)))
      end
    end
  end

  it 'redirects to the new category page when "Add Category" is clicked' do
    visit user_categories_path(@user)

    click_link 'Add Category'

    expect(page).to have_current_path(new_user_category_path(@user))
  end
end
