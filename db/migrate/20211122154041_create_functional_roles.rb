class CreateFunctionalRoles < ActiveRecord::Migration[6.0]
  def change
    create_table :functional_roles do |t|
      t.string :name

      t.timestamps
    end
  end
end
