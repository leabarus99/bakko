class CreateStories < ActiveRecord::Migration[6.1]
  def change
    create_table :stories do |t|
      t.string :content
      t.string :photo
      t.string :title
      t.string :video
      t.string :location
      t.references :trip, null: false, foreign_key: true

      t.timestamps
    end
  end
end
