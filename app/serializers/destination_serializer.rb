class DestinationSerializer < ActiveModel::Serializer
  attributes :id, :name
  has_many :posts
end
  
