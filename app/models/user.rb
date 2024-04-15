class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :missing_animals
  has_many :found_animals
  has_many :chatrooms1, class_name: "Chatroom", foreign_key: "user1_id"
  has_many :chatrooms2, class_name: "Chatroom", foreign_key: "user2_id"
  validates :first_name, :last_name, :phone_number, :location, presence: true
  validates :phone_number, uniqueness: true
  validates :email, uniqueness: true
  validates :birth_date, presence: true

  def chatrooms
    Chatroom.where("user1_id = ? OR user2_id = ?", self.id, self.id)
  end
end
