class UsersController < ApplicationController

  def index

  end


  def show
  @user = User.find_by(id: params[:id])
  respond_to do |f|
      f.html { render :show }
      f.json { render json: @user}
    end
  end

  def create
  end




end
