class CreatePlantInfos < ActiveRecord::Migration[7.1]
  def change
    create_table :plant_infos do |t|
      t.string :name
      t.text :description
      t.text :optimal_growth_conditions
      t.string :photo

      t.timestamps
    end
  end
end
