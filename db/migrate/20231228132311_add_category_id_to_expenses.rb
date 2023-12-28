class AddCategoryIdToExpenses < ActiveRecord::Migration[7.1]
  def change
    add_reference :expenses, :category, null: false, foreign_key: true
  end
end
