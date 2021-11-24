class RemoveStatusFromUserShifts < ActiveRecord::Migration[6.0]
  def change
    remove_column :user_shifts, :status, :string
  end
end
