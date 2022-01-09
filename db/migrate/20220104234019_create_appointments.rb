class CreateAppointments < ActiveRecord::Migration[6.1]
  def change
    create_table :appointments do |t|
      t.datetime :date
      t.integer :cost
      t.integer :duration
      t.integer :client_id
      t.string :stylist_id

      t.timestamps
    end
  end
end
