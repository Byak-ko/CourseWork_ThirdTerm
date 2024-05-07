class CreateClubDocuments < ActiveRecord::Migration[7.1]
  def change
    create_table :club_documents do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
