class AddStatusToFoundAnimals < ActiveRecord::Migration[7.1]
  def change
    add_column :found_animals, :status, :integer
  end
end
