class Chatroom < ApplicationRecord
  has_many :messages, dependent: :destroy
  belongs_to :user1, class_name: "User"
  belongs_to :user2, class_name: "User"
  belongs_to :missing_animal

  enum status: { pending: 0, accepted: 1, rejected: 2 }

  def other_user(current_user)
    self.user1 == current_user ? self.user2 : self.user1
  end

  def accepted?
    self.status == "accepted"
  end

  def pending?
    self.status == "pending"
  end

  def invited?(current_user)
    self.user2 == current_user
  end
end
