class CreateCategoriesTransactions < ActiveRecord::Migration[7.1]
  def change
    create_table :categories_transactions do |t|
      t.references :categories, null: false, foreign_key: true
      t.references :transactions, null: false, foreign_key: true

      t.timestamps
    end
  end
end
