class AddColumnsToIssues < ActiveRecord::Migration[7.0]
  def change
    add_column :issues, :summary, :text
    add_column :issues, :timespent, :integer
    add_column :issues, :status, :string
    add_column :issues, :user_id, :integer
  end
end
