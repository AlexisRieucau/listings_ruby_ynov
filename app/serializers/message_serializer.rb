class MessageSerializer < ActiveModel::Serializer
  attributes :id, :created_at, :updated_at, :content, :listing_id, :user_ach_id, :user_ven_id
end
