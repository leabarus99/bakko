class AddInfosToStories < ActiveRecord::Migration[6.1]
  def change
    add_column :stories, :part_number, :string
  end
end
