class Category < ApplicationRecord
  belongs_to :user
  has_many :categories_expenses, dependent: :destroy
  has_many :expenses, through: :categories_expenses, dependent: :destroy

  validates :name, presence: true
  validates :icon, presence: true
end
