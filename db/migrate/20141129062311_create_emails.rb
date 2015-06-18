class CreateEmails < ActiveRecord::Migration
  def change
    create_table :emails do |t|
      t.text :subject
      t.text :body
      t.string :to

      t.timestamps
    end
  end
end
