class CreatePartners < ActiveRecord::Migration[7.1]
  def change
    create_table :partners do |t|
      t.string :name
      t.string :email
      t.string :phone

      t.timestamps
    end
  end
end
