require 'rails_helper'

RSpec.describe Category, type: :model do
  let(:user) { User.create(name: 'John Doe', email: 'john@example.com', password: 'password123') }

  it 'is valid with valid attributes' do
    category = Category.new(
      name: 'Food',
      icon: '🍔',
      user:
    )
    expect(category).to be_valid
  end

  it 'is not valid without a name' do
    category = Category.new(
      icon: '🍔',
      user:
    )
    expect(category).to_not be_valid
  end

  it 'is not valid without an icon' do
    category = Category.new(
      name: 'Food',
      user:
    )
    expect(category).to_not be_valid
  end
end
