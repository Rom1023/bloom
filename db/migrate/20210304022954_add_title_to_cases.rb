class AddTitleToCases < ActiveRecord::Migration[6.0]
  def change
    add_column :cases, :title, :string
  end
end
