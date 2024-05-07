class AddEmailDeviseToUser < ActiveRecord::Migration[7.1]
  def self.up
    change_table :members do |t|
      ## Database authenticatable
      t.string :email,              null: false, default: ""

    end

    add_index :members, :email,                unique: true
  end

  def self.down
    # By default, we don't want to make any assumption about how to roll back a migration when your
    # model already existed. Please edit below which fields you would like to remove in this migration.
    raise ActiveRecord::IrreversibleMigration
  end
end
