class AddJiraWorklogIdToWorklogs < ActiveRecord::Migration[7.0]
  def change
    add_column :worklogs, :jira_worklog_id, :integer
  end
end
