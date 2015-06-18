class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email, :uid, :token
      t.time :token_expires_at
      t.timestamps
    end
    add_column :emails, :user_id, :integer
    add_index :emails, :user_id
    add_index :users, :uid
  end
end
