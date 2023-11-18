class Message < ApplicationRecord
  validates :content, presence: true

  belongs_to :user
  belongs_to :room
  has_one_attached :image
end
