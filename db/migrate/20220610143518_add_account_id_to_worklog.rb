class AddAccountIdToWorklog < ActiveRecord::Migration[7.0]
  def change
    add_column :worklogs, :jira_author_account_id, :string, null: false
  end
end
