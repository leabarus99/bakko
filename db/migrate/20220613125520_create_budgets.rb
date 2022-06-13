class CreateBudgets < ActiveRecord::Migration[6.1]
  def change
    create_table :budgets do |t|
      t.integer :price
      t.string :category
      t.references :trip, null: false, foreign_key: true

      t.timestamps
    end
  end
end
