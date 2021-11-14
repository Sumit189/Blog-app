class Post < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_one_attached :image, dependent: :purge
  validates :title, presence: true
  validates :content, presence: true, length: { minimum: 10 }
  validates :image, presence: true
  validates :category, presence: true
end
