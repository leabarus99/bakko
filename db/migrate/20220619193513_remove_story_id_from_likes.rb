class RemoveStoryIdFromLikes < ActiveRecord::Migration[6.1]
  def change
    remove_column :likes, :story_id, :string
  end
end
