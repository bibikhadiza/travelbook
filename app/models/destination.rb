class Destination < ActiveRecord::Base
  has_many :posts
  has_many :pins, through: :posts
  has_many :users, through: :posts
  validates :name, presence: :true




  def posts_attributes=(post_attributes)
    result = true
    post_attributes.values.each do |post_attribute|
      if post_attribute[:id].present?
        post = Post.find_by(id: post_attribute[:id])
        result = false if post.update(post_attribute) == false
      else
        self.posts.build(post_attribute)
      end
      result
    end
  end


  # def self.most_pins
  #   arr = []
  #   Destination.all.each do |des|
  #     arr << des.pins
  #   end
  #   @result = result = arr.sort.last
  # end



  def posts_attributes
    self.posts
  end

  def self.search(search)
    where("name LIKE ?", "%#{search}%").first
  end










end
