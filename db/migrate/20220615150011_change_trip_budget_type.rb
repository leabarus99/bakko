class ChangeTripBudgetType < ActiveRecord::Migration[6.1]
  def change
    remove_column :trips, :budget
    add_column :trips, :budget, :float
  end
end
