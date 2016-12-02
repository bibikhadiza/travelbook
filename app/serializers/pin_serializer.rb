class PinSerializer < ActiveModel::Serializer
  attributes :id, :status
  has_one :post
  has_one :user

end
