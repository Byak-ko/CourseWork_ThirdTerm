class ChangeClubDocumentsTable < ActiveRecord::Migration[7.1]
  def change
    change_table :club_documents do |t|
      t.rename :name, :document_name
      t.string :document_path
      t.references :member, foreign_key: true
    end
  end
end