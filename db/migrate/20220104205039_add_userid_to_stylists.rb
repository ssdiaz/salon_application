class AddUseridToStylists < ActiveRecord::Migration[6.1]
  def change
    add_column :stylists, :user_id, :integer
  end
end
