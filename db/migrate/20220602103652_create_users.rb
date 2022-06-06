class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :account_id
      t.boolean :active
      t.integer :organization_id

      t.timestamps
    end
  end
end
