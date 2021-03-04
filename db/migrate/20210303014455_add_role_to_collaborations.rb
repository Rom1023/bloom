class AddRoleToCollaborations < ActiveRecord::Migration[6.0]
  def change
    add_column :collaborations, :role, :string
  end
end
