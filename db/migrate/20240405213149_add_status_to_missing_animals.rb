class AddStatusToMissingAnimals < ActiveRecord::Migration[7.1]
  def change
    add_column :missing_animals, :status, :integer
  end
end
