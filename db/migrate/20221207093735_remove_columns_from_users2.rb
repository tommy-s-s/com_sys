class RemoveColumnsFromUsers2 < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :b_day, :string
    remove_column :users, :domicile, :string
    remove_column :users, :tel_now, :string
  end
end
