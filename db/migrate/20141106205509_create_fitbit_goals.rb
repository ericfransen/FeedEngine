class CreateFitbitGoals < ActiveRecord::Migration
  def change
    create_table :fitbit_goals do |t|

      t.timestamps
    end
  end
end
