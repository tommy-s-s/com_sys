class AddEtcToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :liveaddress, :string
    add_column :users, :station, :string
    add_column :users, :salary, :bigint
    add_column :users, :bh_date, :date
  end
end
