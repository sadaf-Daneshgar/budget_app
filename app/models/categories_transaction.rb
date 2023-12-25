class CategoriesTransaction < ApplicationRecord
  belongs_to :categories
  belongs_to :transactions
end
