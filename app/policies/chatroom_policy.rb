class ChatroomPolicy < ApplicationPolicy
  def show?
    record.user1_id == user.id || record.user2_id == user.id
  end
end
