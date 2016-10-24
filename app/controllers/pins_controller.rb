class PinsController < ApplicationController



  def new
    user = User.find_by(id: params[:user_id])
    user.pins.create(status: "active")
    binding.pry
  end

  def index
  end











end
