class CreateStylists < ActiveRecord::Migration[6.1]
  def change
    create_table :stylists do |t|

      t.timestamps
    end
  end
end
