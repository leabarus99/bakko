class AddInfoToStories < ActiveRecord::Migration[6.1]
  def change
    add_column :stories, :introduction, :string
    add_column :stories, :description, :string
  end
end
