class AddOpenToUserShifts < ActiveRecord::Migration[6.0]
  def change
    add_column :user_shifts, :open, :boolean
  end
end
