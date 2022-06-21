class CreateLiikes < ActiveRecord::Migration[6.1]
  def change
    create_table :liikes do |t|
      t.references :user, null: false, foreign_key: true
      t.references :story, null: false, foreign_key: true

      t.timestamps
    end
  end
end
