class Post < ActiveRecord::Base
  mount_uploader :avatar, AvatarUploader
  belongs_to :user
  belongs_to :destination
  has_many :pins
  validates :title, :flight, :total_cost, :diet, :climate, :content, :car_rental, presence: true
  validates :avatar, presence: true, allow_blank: false


  def destination_attributes=(destination_attributes)
    if destination_attributes["name"]
      destination_name = destination_attributes["name"].split.map(&:capitalize)*' '
      self.destination = Destination.find_or_create_by(name: destination_name)

    end
  end

  def destination_attributes
    self.destination
  end




end
