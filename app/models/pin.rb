class Pin < ActiveRecord::Base
  belongs_to :user
  belongs_to :post
  scope :active_pins, -> (current_user) { where(status: true, user_id: current_user.id )}
  scope :inactive_pins, -> (current_user) { where(status: false, user_id: current_user.id )}


  # def self.active_pins(current_user)
  #   binding.pry
  #   where(status: true, user_id: current_user.id)
  # end
end
