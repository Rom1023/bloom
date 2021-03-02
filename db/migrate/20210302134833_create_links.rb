class CreateLinks < ActiveRecord::Migration[6.0]
  def change
    create_table :links do |t|
      t.references :case, null: false, foreign_key: true
      t.references :project, null: false, foreign_key: true

      t.timestamps
    end
  end
end
