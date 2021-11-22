class CreatePrizes < ActiveRecord::Migration[6.0]
  def change
    create_table :prizes do |t|
      t.integer :bonus_points
      t.string :prize

      t.timestamps
    end
  end
end
