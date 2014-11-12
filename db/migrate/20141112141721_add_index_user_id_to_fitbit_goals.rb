class AddIndexUserIdToFitbitGoals < ActiveRecord::Migration
  def change
    add_index :fitbit_goals, :user_id
  end
end
