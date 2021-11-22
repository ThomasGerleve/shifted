class CreateShifts < ActiveRecord::Migration[6.0]
  def change
    create_table :shifts do |t|
      t.date :date
      t.references :slot, null: false, foreign_key: true
      t.integer :bonus_points

      t.timestamps
    end
  end
end
