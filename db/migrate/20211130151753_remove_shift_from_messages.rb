class RemoveShiftFromMessages < ActiveRecord::Migration[6.0]
  def change
    add_column :messages, :user_shift_id, :bigint, null: false
    add_foreign_key :messages, :user_shifts
    add_index :messages, :user_shift_id
    remove_foreign_key :messages, :shifts
    remove_index :messages, :shift_id
    remove_column :messages, :shift_id
  end
end
