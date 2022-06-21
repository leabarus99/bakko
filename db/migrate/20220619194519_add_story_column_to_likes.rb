class AddStoryColumnToLikes < ActiveRecord::Migration[6.1]
  def change
    add_reference :likes, :story, null: false, foreign_key: true
  end
end
