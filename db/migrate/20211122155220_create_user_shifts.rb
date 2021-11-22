class CreateUserShifts < ActiveRecord::Migration[6.0]
  def change
    create_table :user_shifts do |t|
      t.references :user, null: false, foreign_key: true
      t.references :shift, null: false, foreign_key: true
      t.integer :bonus_points
      t.string :status
      t.text :details

      t.timestamps
    end
  end
end
