class CreateAppointments < ActiveRecord::Migration[6.1]
  def change
    create_table :appointments do |t|
      t.datetime :date
      t.integer :price
      t.integer :minutes #duration
      t.integer :client_id
      t.string :stylist_id

      t.timestamps
    end
  end
end
