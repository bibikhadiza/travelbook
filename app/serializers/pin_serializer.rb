class PinSerializer < ActiveModel::Serializer
  attributes :id, :status, :user_id
  belongs_to :post
  # belongs_to :user

end
