class CreateFishInfos < ActiveRecord::Migration[7.1]
  def change
    create_table :fish_infos do |t|
      t.string :name
      t.text :description
      t.text :features
      t.string :photo

      t.timestamps
    end
  end
end
