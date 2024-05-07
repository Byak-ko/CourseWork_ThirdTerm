class CreateItemInfos < ActiveRecord::Migration[7.1]
  def change
    create_table :item_infos do |t|
      t.string :name
      t.text :description
      t.float :price
      t.boolean :available
      t.string :photo

      t.timestamps
    end
  end
end
