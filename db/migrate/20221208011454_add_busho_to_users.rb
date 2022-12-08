class AddBushoToUsers < ActiveRecord::Migration[7.0]
  def change
    add_reference :users, :busho, null: true, foreign_key: true
  end
end
