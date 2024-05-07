class RemoveFieldsFromItemInfos < ActiveRecord::Migration[7.1]
  def change
    remove_column :item_infos, :photo, :string
    remove_column :item_infos, :price, :float
  end
end