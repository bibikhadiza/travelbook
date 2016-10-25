class Post < ActiveRecord::Base
  mount_uploader :avatar, AvatarUploader
  belongs_to :user
  belongs_to :destination
  has_many :pins
  validates :car_rental, presence: true
  validates :title, :flight, :total_cost, :diet, :climate, :content, presence: true
  validates :avatar, presence: true, allow_blank: false
  validates_presence_of :car_rental, :flight, :diet, :climate, :numericality => {:greater_than => 0, :less_than => 6}





end
