class AddUsersToChatrooms < ActiveRecord::Migration[6.0]
  def up
    add_reference :chatrooms, :user1, foreign_key: { to_table: :users }
    add_reference :chatrooms, :user2, foreign_key: { to_table: :users }
  end

  def down
    remove_reference :chatrooms, :user1, foreign_key: { to_table: :users }
    remove_reference :chatrooms, :user2, foreign_key: { to_table: :users }
  end
end
