class AddStoryIdColumnToLikes < ActiveRecord::Migration[6.1]
  def change
    add_column :likes, :story_id, :string
  end
end
