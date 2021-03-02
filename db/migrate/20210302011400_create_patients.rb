class CreatePatients < ActiveRecord::Migration[6.0]
  def change
    create_table :patients do |t|
      t.string :first_name
      t.string :last_name
      t.string :gender
      t.date :date_of_birth
      t.text :address

      t.timestamps
    end
  end
end
