class DeleteAvailableFromItemInfos < ActiveRecord::Migration[7.1]
  def change
    remove_column :item_infos, :available, :boolean
  end
end
