class CreatePreferredSlots < ActiveRecord::Migration[6.0]
  def change
    create_table :preferred_slots do |t|
      t.references :user, null: false, foreign_key: true
      t.references :slot, null: false, foreign_key: true
      t.string :weekday

      t.timestamps
    end
  end
end
