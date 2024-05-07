class AddCategoryToItemInfos < ActiveRecord::Migration[7.1]
  def change
    add_column :item_infos, :category, :string, default: "other"
  end
end