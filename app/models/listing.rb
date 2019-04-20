class Listing < ApplicationRecord
  has_one_attached :attached_picture
  belongs_to :category
  belongs_to :user
  has_many :messages
end
