class DeleteDataFromOrderInfos < ActiveRecord::Migration[7.1]
  def change
    remove_column :order_infos, :date, :date
  end
end
