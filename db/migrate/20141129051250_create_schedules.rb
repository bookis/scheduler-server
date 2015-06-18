class CreateSchedules < ActiveRecord::Migration
  def change
    create_table :schedules do |t|
      t.datetime :send_at
      t.integer :email_id

      t.timestamps
    end
  end
end
