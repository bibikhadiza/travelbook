class PostSerializer < ActiveModel::Serializer
  attributes :id, :title, :car_rental, :flight, :total_cost, :diet, :climate, :content, :avatar, :user, :created_at, :vacation_type
  has_one :user
  has_many :pins
  has_one :destination
end
