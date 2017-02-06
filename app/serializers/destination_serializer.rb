class DestinationSerializer < ActiveModel::Serializer
  attributes :id, :name, :pictures
  has_many :posts
end
