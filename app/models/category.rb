class Category < ApplicationRecord
  belongs_to :user
  has_many :transactions, through: :categories_transactions
  has_many :categories_transactions

  validates :name, presence: true
  validates :icon, presence: true
end
