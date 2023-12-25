class Transaction < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :categories, through: :categories_transactions
  has_many :categories_transactions

  validates :name, presence: true
  validates :amount, presence: true
  validates :author_id, presence: true
end
