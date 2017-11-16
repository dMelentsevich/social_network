class User < ApplicationRecord
  validates :email, presence: true
  validates :password, presence: true, length: { in: 6..72, wrong_lenght: "Password lenght should be in 3-45 characters" }
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable
end
