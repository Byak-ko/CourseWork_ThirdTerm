class RemovePhotoFromPlantInfos < ActiveRecord::Migration[7.1]
  def change
    remove_column :plant_infos, :photo, :string
  end
end