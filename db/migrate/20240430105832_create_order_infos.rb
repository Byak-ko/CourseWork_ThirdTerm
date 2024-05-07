class CreateOrderInfos < ActiveRecord::Migration[7.1]
  def change
    create_table :order_infos do |t|
      t.string :order_number
      t.date :date
      t.references :member, null: false, foreign_key: true
      t.string :items
      t.integer :quantity
      t.float :total_price

      t.timestamps
    end
  end
end
