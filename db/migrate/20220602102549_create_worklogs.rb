class CreateWorklogs < ActiveRecord::Migration[7.0]
  def change
    create_table :worklogs do |t|
      t.integer :timeSpent
      t.integer :user_id
      t.references :issue, null: false, foreign_key: true

      t.timestamps
    end
  end
end
