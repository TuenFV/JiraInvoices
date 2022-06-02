class CreateProjects < ActiveRecord::Migration[7.0]
  def change
    create_table :projects do |t|
      t.text :name
      t.string :code
      t.integer :jira_project_id
      t.references :organization, null: false, foreign_key: true

      t.timestamps
    end
  end
end
