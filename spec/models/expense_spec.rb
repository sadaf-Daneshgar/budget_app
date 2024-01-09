require 'rails_helper'

RSpec.describe Expense, type: :model do
  let(:user) { User.create(name: 'John Doe', email: 'john@example.com', password: 'password123') }
  let(:category) { Category.create(name: 'Food') }

  it 'is valid with valid attributes' do
    expense = Expense.new(
      name: 'Groceries',
      amount: 50.00,
      author_id: user.id,
      category:
    )
    expect(expense).to be_valid
  end

  it 'is not valid without a name' do
    expense = Expense.new(
      amount: 50.00,
      author_id: user.id,
      category:
    )
    expect(expense).to_not be_valid
  end

  it 'is not valid without an amount' do
    expense = Expense.new(
      name: 'Groceries',
      author_id: user.id,
      category:
    )
    expect(expense).to_not be_valid
  end

  it 'is not valid without an author_id' do
    expense = Expense.new(
      name: 'Groceries',
      amount: 50.00,
      category:
    )
    expect(expense).to_not be_valid
  end
end
