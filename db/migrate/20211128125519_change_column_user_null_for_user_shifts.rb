class ChangeColumnUserNullForUserShifts < ActiveRecord::Migration[6.0]
  def change
    change_column_null :user_shifts, :user_id, true
  end
end
