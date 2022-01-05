class CreateStylistServices < ActiveRecord::Migration[6.1]
  def change
    create_table :stylist_services do |t|
      t.integer :stylist_id
      t.integer :service_id

      t.timestamps
    end
  end
end
