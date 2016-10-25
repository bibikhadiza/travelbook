class Post < ActiveRecord::Base
  mount_uploader :avatar, AvatarUploader
# skip_callback :commit, :after, :remove_previously_stored_avatar
  belongs_to :user
  belongs_to :destination
  has_many :pins
  validates :title, :car_rental, :flight, :total_cost, :diet, :climate, :content, presence: true
  validates :avatar, presence: true
  validates :car_rental, :flight, :diet, :climate, :numericality => {:greater_than => 0, :less_than => 6}




end
