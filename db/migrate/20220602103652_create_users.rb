class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :full_name
      t.integer :account_id
      t.integer :organiztion_id

      t.timestamps
    end
  end
end
