class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :first_name, :last_name, :phone_number, :location, presence: true
  validates :phone_number, uniqueness: true
  validates :email, uniqueness: true
  validates :birth_date, presence: true
end
