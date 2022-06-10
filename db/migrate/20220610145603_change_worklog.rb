class ChangeWorklog < ActiveRecord::Migration[7.0]
  def change
    rename_column :worklogs, :timeSpent, :time_spent
    rename_column :worklogs, :startTime, :start_time
    remove_column :worklogs, :updateTime
    remove_column :worklogs, :user_id
  end
end
