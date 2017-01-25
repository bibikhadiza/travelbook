class Pin < ActiveRecord::Base
  belongs_to :user
  belongs_to :post
  scope :active_pins, -> (current_user) { where(status: true, user_id: current_user.id )}
  scope :inactive_pins, -> (current_user) { where(status: false, user_id: current_user.id )}






end
