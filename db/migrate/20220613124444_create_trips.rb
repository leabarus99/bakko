class CreateTrips < ActiveRecord::Migration[6.1]
  def change
    create_table :trips do |t|
      t.string :destination
      t.date :start_date
      t.date :end_date
      t.references :user, null: false, foreign_key: true
      t.string :budget

      t.timestamps
    end
  end
end
