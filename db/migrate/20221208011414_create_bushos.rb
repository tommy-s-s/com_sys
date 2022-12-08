class CreateBushos < ActiveRecord::Migration[7.0]
  def change
    create_table :bushos do |t|
      t.integer :busho_no
      t.string :busho_name

      t.timestamps
    end
  end
end
