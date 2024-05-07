class CreateMembers < ActiveRecord::Migration[7.1]
  def change
    create_table :members do |t|
      t.string :first_name
      t.string :last_name
      t.string :address
      t.string :email
      t.string :phone
      t.string :role

      t.timestamps
    end
  end
end
