class CreateCases < ActiveRecord::Migration[6.0]
  def change
    create_table :cases do |t|
      t.string :description
      t.references :user, null: false, foreign_key: true
      t.references :patient, null: false, foreign_key: true

      t.timestamps
    end
  end
end
