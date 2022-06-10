class AddStartTimeAndUpdateTimeToWorklogs < ActiveRecord::Migration[7.0]
  def change
    add_column :worklogs, :startTime, :datetime
    add_column :worklogs, :updateTime, :datetime
  end
end
