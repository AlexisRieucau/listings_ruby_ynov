class ListingSerializer < ActiveModel::Serializer
  attributes :id, :title, :category_id, :description, :price, :created_at, :updated_at, :user_id
end
