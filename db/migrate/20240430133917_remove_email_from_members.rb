class RemoveEmailFromMembers < ActiveRecord::Migration[7.1]
  def change
    remove_column :members, :email, :string
  end
end
