class Expense < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :category
  has_many :categories_expenses, dependent: :destroy
  has_many :categories, through: :categories_expenses

  validates :name, presence: true
  validates :amount, presence: true
  validates :author_id, presence: true
end
