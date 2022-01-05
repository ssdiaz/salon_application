class CreateSchedules < ActiveRecord::Migration[6.1]
  def change
    create_table :schedules do |t|
      t.time :start_time
      t.time :end_time
      t.date :workday
      t.integer :stylist_id

      t.timestamps
    end
  end
end
