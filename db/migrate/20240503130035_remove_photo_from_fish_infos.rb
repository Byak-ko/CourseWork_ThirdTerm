class RemovePhotoFromFishInfos < ActiveRecord::Migration[7.1]
  def change
    remove_column :fish_infos, :photo, :string
  end
end