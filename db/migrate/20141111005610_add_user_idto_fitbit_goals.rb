class AddUserIdtoFitbitGoals < ActiveRecord::Migration
  def change
    add_column :fitbit_goals, :user_id, :integer
  end
end
