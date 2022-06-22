class CreateRelationnships < ActiveRecord::Migration[6.1]
  def change
    create_table :relationnships do |t|
      t.integer :follower_id
      t.integer :followee_id

      t.timestamps
    end
  end
end
