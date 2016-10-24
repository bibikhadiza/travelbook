class PinsController < ApplicationController



  def new
    post = Post.find_by(id: params[:post_id])
    post.pins.create(user_id: current_user.id)
    redirect_to post_path(post)
  end

  def index
    user = User.find_by(id: params[:user_id])
    Pin.active_pins(user)
  binding.pry

  end











end
