class AddTimeToTextToUsers < ActiveRecord::Migration
  def change
    add_column :users, :time_to_text, :time
  end
end
