class User < ActiveRecord::Base

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         devise :omniauthable, :omniauth_providers => [:facebook]

  has_many :posts
  has_many :pins
  has_many :destinations, through: :posts
  # has_many :post_pins, through: :posts, :source :pins



  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
    end
  end




  def post_pins
    arr = []
    self.posts.each do |post|
      arr << post.pins.count
    end
      arr.sum
  end






















end
