class Post < ActiveRecord::Base
  mount_uploader :avatar, AvatarUploader
# skip_callback :commit, :after, :remove_previously_stored_avatar
  belongs_to :user
  belongs_to :destination
  has_many :pins



end
