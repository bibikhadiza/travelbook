class DestinationsController < ApplicationController
  before_action :find_destination



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
      @destination.posts.build
    else
      @destination = Destination.new
        @destination.posts.build
    end
  end



  def create
    @destination = Destination.find_or_initialize_by(name: params[:destination][:name])
    if @destination.update(location_params)
      redirect_to users_path
    else
      render "new"
    end
  end




  def show
    if @destination && @destination.posts.present?
      @destination_posts = @destination.posts
    else
      flash[:notice] = "This destination does not have any posts"
    end
  end



  def edit
    @post = Post.find_by(id: params[:post_id])

  end



  def update
    @post = Post.find_by(id: params[:destination][:posts_attributes]["0"][:id])
      if @post
        x = params[:destination][:posts_attributes]["0"]
        if @destination.update(location_params) && @post.update(title: x[:title], total_cost: x[:total_cost], flight: x[:flight], climate: x[:climate], car_rental: x[:car_rental], diet: x[:diet], content: x[:content])
          redirect_to users_path
        else
          render "edit"
        end
      else
        if @destination.update(location_params)
          redirect_to users_path
        else
          render "edit"
        end
      end
  end


  private

  def location_params
    params.require(:destination).permit(:name, :posts_attributes => [:title, :total_cost, :flight, :climate, :car_rental, :diet, :content, :user_id, :avatar, :id])
  end


  def find_destination
    @destination = Destination.find_by(id: params[:id])
  end









end
