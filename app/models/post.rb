class Post < ActiveRecord::Base
  mount_uploader :avatar, AvatarUploader
  belongs_to :user
  belongs_to :destination
  has_many :pins
  validates :title, :flight, :total_cost, :diet, :climate, :content, :car_rental, presence: true
  validates :avatar, presence: true, allow_blank: false
  validates_numericality_of :car_rental, :flight, :diet, :climate, :greater_than_or_equal_to => 1, :less_than_or_equal_to => 5


  def destination_attributes=(destination_attributes)
    binding.pry
    destination_name = destination_attributes["name"].split.map(&:capitalize)*' '
    self.destination = Destination.find_or_create_by(name: destination_name)
  end

  def destination_attributes
    self.destination
  end




end
