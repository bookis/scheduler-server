class CreateEmails < ActiveRecord::Migration
  def change
    create_table :emails do |t|
      t.text :subject
      t.text :body
      t.string :to
      t.integer :times
      t.integer :every_n_minutes
      t.time :send_first_at

      t.timestamps
    end
  end
end
