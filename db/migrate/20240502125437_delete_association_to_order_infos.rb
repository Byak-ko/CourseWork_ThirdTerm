class DeleteAssociationToOrderInfos < ActiveRecord::Migration[7.1]
  def change
    remove_reference :order_infos, :member, null: false, foreign_key: true
    change_table :order_infos do |t|
      t.remove :order_number
    end
  end
end