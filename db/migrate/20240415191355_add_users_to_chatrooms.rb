class AddUsersToChatrooms < ActiveRecord::Migration[6.0]
  def up
    add_reference :chatrooms, :user1, null: true, foreign_key: { to_table: :users }
    add_reference :chatrooms, :user2, null: true, foreign_key: { to_table: :users }

    # Assuming User.first can be used as a default user
    default_user = User.first
    Chatroom.update_all(user1_id: default_user.id, user2_id: default_user.id)

    change_column_null :chatrooms, :user1_id, false
    change_column_null :chatrooms, :user2_id, false
  end

  def down
    remove_reference :chatrooms, :user1, foreign_key: { to_table: :users }
    remove_reference :chatrooms, :user2, foreign_key: { to_table: :users }
  end
end
