class AddAttributsToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :phone_number, :string
    add_column :users, :username, :string
    add_column :users, :followers, :integer
    add_column :users, :following, :integer
  end
end
