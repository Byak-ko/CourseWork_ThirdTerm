class AddAssociationsToOrderInfos < ActiveRecord::Migration[7.1]
  def change
    change_table :order_infos do |t|
      t.references :creator, null: false, foreign_key: { to_table: :members }
      t.references :buyer, foreign_key: { to_table: :members }
      t.references :item_info, null: false, foreign_key: true
      t.remove :quantity
      t.rename :total_price, :price
    end
  end
end