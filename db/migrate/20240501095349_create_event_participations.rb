class CreateEventParticipations < ActiveRecord::Migration[7.1]
  def change
    create_table :event_participations do |t|
      t.references :member, null: false, foreign_key: true
      t.references :event, null: false, foreign_key: true

      t.timestamps
    end
  end
end
