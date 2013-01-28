class CreateSchedules < ActiveRecord::Migration
  def change
    create_table :schedules do |t|
      t.datetime :basedate
      t.integer :repeat_type
      t.integer :user_id

      t.timestamps
    end
  end
end
