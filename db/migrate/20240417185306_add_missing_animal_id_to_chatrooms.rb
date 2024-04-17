class AddMissingAnimalIdToChatrooms < ActiveRecord::Migration[7.1]
  def change
    add_column :chatrooms, :missing_animal_id, :integer
  end
end
