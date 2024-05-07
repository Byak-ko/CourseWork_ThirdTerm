class RemoveFieldsClubDocumentsTable < ActiveRecord::Migration[7.1]
  def change
    remove_column :club_documents, :document_name, :string
    remove_column :club_documents, :document_path, :string
    remove_column :club_documents, :description, :text
  end
end
