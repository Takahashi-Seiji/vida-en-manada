class CreateMissingAnimals < ActiveRecord::Migration[7.1]
  def change
    create_table :missing_animals do |t|
      t.string :species
      t.integer :age
      t.string :name
      t.string :breed
      t.string :lost_location
      t.date :date_lost
      t.boolean :sterilized
      t.string :size
      t.string :color
      t.string :sex
      t.text :description
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
