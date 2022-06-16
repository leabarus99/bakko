class CreateEquipment < ActiveRecord::Migration[6.1]
  def change
    create_table :equipment do |t|
      t.string :name
      t.string :details
      t.string :benefits
      t.float :price_estimation
      t.timestamps
    end
  end
end
