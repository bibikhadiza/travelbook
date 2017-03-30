class Post < ActiveRecord::Base
  mount_uploader :avatar, AvatarUploader
  belongs_to :user
  belongs_to :destination
  has_many :pins
  validates :title, :flight, :total_cost, :diet, :climate, :content, :car_rental, presence: true
  validates :avatar, presence: true, allow_blank: false
  validate :must_have_a_destination
  scope :all_posts, -> {Post.order(id: :desc)}
  scope :inspiration_posts, -> (type) {where(vacation_type: type) }

  def must_have_a_destination
    if !self.destination_id
      self.errors.messages[:bad_destination] = ["Please choose only one destination"]
    end
  end


  def destination_attributes=(destination_attributes)
    if self.destination && !destination_attributes["name"].empty?
      self.destination = nil
    end

    if !self.destination && !destination_attributes["name"].empty?
      destination_name = destination_attributes["name"].split.map(&:capitalize)*' '
      self.destination = Destination.find_or_create_by(name: destination_name)
    end

    if self.destination && destination_attributes["name"].empty?
      self.destination = Destination.find_by(id: self.destination.id)
    end
  end
  #if there is a destinaton id and the name key is provided in the destinations_attribute params
  #then we set the destination to nil for the post object because we do not want two destinations entered.
  #this way now the post will error out because a destiantion is not provided

  #in the nest condition is the destination was not choosen from the options provided and the destination name is provided then we find or create the destination by name and associate it to the post.

  #else of course a destination is choosen from the options and the post now is assigned to the choosen destination.


  def destination_attributes
    self.destination
  end




end
