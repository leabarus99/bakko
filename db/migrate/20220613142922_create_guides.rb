class CreateGuides < ActiveRecord::Migration[6.1]
  def change
    create_table :guides do |t|
      t.string :content
      t.string :title
      t.string :author
      t.string :category
      t.integer :difficulty

      t.timestamps
    end
  end
end
