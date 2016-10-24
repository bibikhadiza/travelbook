class DestinationsController < ApplicationController
  before_action :check_logged_in?, :find_destination

  def index
  end

  def new
      if params[:id]
      @destination = Destination.find_by(id: params[:id])
      @destination.posts.build
      else
        @destination = Destination.new
        @destination.posts.build
    # @post = @destination.posts.build(destination_id: @destination.id)
    # @post = current_user.posts.build(destination_id: @destination.id)
  end
  end


  def show
    @destination = Destination.find_by(id: params[:id])
  end

  def create
    @destination = Destination.find_or_create_by(name: params[:destination][:name])
    @destination.update(location_params)
    redirect_to users_path
  end

  def edit
    @destination = Destination.find_by(id: params[:id])
    @post = Post.find_by(id: params[:post_id])

  end



  def update
    @destination.update(location_params)
      redirect_to users_path
  end







  private

  def location_params
    params.require(:destination).permit(:name, :posts_attributes => [:title, :total_cost, :flight, :climate, :car_rental, :diet, :content, :user_id, :avatar, :id])
  end

  def find_destination
    @destination = Destination.find_by(id: params[:id])
  end









end
