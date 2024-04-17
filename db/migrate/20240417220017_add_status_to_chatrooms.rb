class AddStatusToChatrooms < ActiveRecord::Migration[7.1]
  def change
    add_column :chatrooms, :status, :integer
  end
end
