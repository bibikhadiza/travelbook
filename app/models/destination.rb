class Destination < ActiveRecord::Base
  has_many :posts
  has_many :pins, through: :posts
  has_many :users, through: :posts
  validates :name, presence: :true
  serialize :pictures




  def self.search(search)
    where("name LIKE ?", "%#{search}%").first
  end










end
