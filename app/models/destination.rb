class Destination < ActiveRecord::Base
  has_many :posts
  has_many :pins, through: :posts
  has_many :users, through: :posts
  validates :name, presence: true




  def posts_attributes=(post_attributes)
    post_attributes.values.each do |post_attribute|
      if post_attribute[:id].present?
        post = Post.find_by(id: post_attribute[:id])
        post.update(post_attribute)
      else
        self.posts.build(post_attribute)
      end
    end
  end



  def posts_attributes
    self.posts
  end

  def self.search(search)
  where("name LIKE ?", "%#{search}%").first
end











end
