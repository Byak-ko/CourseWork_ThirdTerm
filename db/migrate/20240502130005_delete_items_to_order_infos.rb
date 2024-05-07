class DeleteItemsToOrderInfos < ActiveRecord::Migration[7.1]
  def change
    change_table :order_infos do |t|
      t.remove :items
    end
  end
end
