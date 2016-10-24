class DestinationsController < ApplicationController
  before_action :check_logged_in?, :find_destination



  def index
    if params[:search]
      @destination = Destination.search(params[:search])
      if @destination
        redirect_to destination_path(@destination)
      else
        flash[:notice] = "This destination does not exist. Please search another destination"
        redirect_to users_path
      end
    end
  end



  def new
      if params[:id]
        @destination = Destination.find_by(id: params[:id])
        @destination.posts.build
      else
        @destination = Destination.new
        @post = @destination.posts.build
    end
  end


  def show
    @destination = Destination.find_by(id: params[:id])
    if @destination && @destination.posts.present?
      @destination_posts = @destination.posts
    else
      flash[:notice] = "This destination does not have any posts"
    end
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
