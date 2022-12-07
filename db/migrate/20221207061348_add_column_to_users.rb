class AddColumnToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :emp_no, :integer
    add_column :users, :sex, :string
    add_column :users, :b_day, :string
    add_column :users, :admin, :boolean, default: false
    add_column :users, :domicile, :string
    add_column :users, :tel_no, :integer
  end
end
