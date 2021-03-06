class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  default_scope -> { order(created_at: :desc) }

  validates :user_id, presence: true
  validates :body, presence: true
  validates :body, length: { in: 3..500 }
end
