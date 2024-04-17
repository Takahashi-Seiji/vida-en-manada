class Chatroom < ApplicationRecord
  has_many :messages, dependent: :destroy
  belongs_to :user1, class_name: "User"
  belongs_to :user2, class_name: "User"
  belongs_to :missing_animal

  enum status: { pending: 0, accepted: 1, rejected: 2 }
end
