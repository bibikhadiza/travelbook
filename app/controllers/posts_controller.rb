class PostsController < ApplicationController

  def index
    @posts = Post.all_posts
    render json: @posts
  end


  def new
    @post = Post.new
    @destinations = Destination.all
    @post.destination.build
  end



  def create
    @post = Post.new(post_params)
    if @post.save
      render json: @post
    else
      render json: @post.errors.full_messages, status: 422
    end
  end

  #we first instantiate a new object a if an id is set to the destination it post should be valid
  #we check the destination_attributes post model method




  def show
    @post = Post.find_by(id: params[:id])
    current_user.pins.map do |pin|
      @pin = (pin.post_id == @post.id)
    end
    if @pin
      flash[:notice] = "You Have Pinned This Post"
    end
    respond_to do |f|
        f.html { render :show }
        f.json { render json: @post, adapter: :json}

      end
  end





  def edit
    @post = Post.find_by(id: params[:id])
    @destination = @post.destination
  end


  def update
    @post = Post.find_by(id: params[:destination][:posts_attributes]["0"][:id])
    @destination = Destination.find_by(name: params[:destination][:name])
      if @post
        x = params[:destination][:posts_attributes]["0"]
        if @destination.update(location_params) && @post.update(title: x[:title], total_cost: x[:total_cost], flight: x[:flight], climate: x[:climate], car_rental: x[:car_rental], diet: x[:diet], content: x[:content])
          redirect_to user_path(current_user)
        else
          render "edit"
        end
      else
        if @destination.update(location_params)
          redirect_to user_path(current_user)
        else
          @destination.posts.build
          render "edit"
        end
      end
  end



  private

  def post_params
    params.require(:post).permit(:title, :vacation_type, :total_cost, :flight, :climate, :car_rental, :diet, :content, :user_id, :avatar, :destination_id, :destination_attributes => [:name])
  end



end
