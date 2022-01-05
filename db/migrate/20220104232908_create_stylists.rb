class CreateStylists < ActiveRecord::Migration[6.1]
  def change
    create_table :stylists do |t|
      t.string :name
      t.string :email
      t.string :handle
      t.integer :level

      t.timestamps
    end
  end
end
