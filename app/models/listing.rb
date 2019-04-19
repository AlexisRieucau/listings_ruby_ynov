class Listing < ApplicationRecord
  has_one_attached :image
  belongs_to :category
  has_many :messages
end
