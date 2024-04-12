class AddLatitudeAndLongitudeToFoundAnimals < ActiveRecord::Migration[7.1]
  def change
    add_column :found_animals, :latitude, :float
    add_column :found_animals, :longitude, :float
  end
end
