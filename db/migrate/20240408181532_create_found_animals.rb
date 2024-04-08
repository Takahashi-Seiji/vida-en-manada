class CreateFoundAnimals < ActiveRecord::Migration[7.1]
  def change
    create_table :found_animals do |t|
      t.references :user, null: false, foreign_key: true
      t.string :species
      t.integer :age
      t.string :breed
      t.string :found_location
      t.date :found_date
      t.boolean :sterilized
      t.string :size
      t.string :color
      t.string :sex
      t.text :description

      t.timestamps
    end
  end
end
