class Post < ApplicationRecord
  belongs_to :user
    has_many :posts_with_comments, through: :comments, class_name: 'Post'
  has_many :comments, dependent: :destroy
  validates :title, presence: true, length: {minimum: 5}
  validates :body, presence: true
end
