class PinsController < ApplicationController



  def new
    post = Post.find_by(id: params[:post_id])
    post.pins.create(user_id: current_user.id)
    redirect_to post_path(post)
  end

  def index
    user = User.find_by(id: params[:user_id])
    binding.pry
    @active_pins = Pin.active_pins(user)
    @inactive_pins = Pin.inactive_pins(user)
  end


  def edit
    @pin = Pin.find_by(id: params[:id])
    @pin.update(status: false)
    flash[:notice] = "You have visited #{@pin.post.destination.name}"
    redirect_to user_pins(current_user)
  end











end
