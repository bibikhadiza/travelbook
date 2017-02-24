class PostsController < ApplicationController


  def index
    @posts = Post.all_posts
    respond_to do |f|
        f.html { render :index }
        f.json { render json: @posts }
      end
  end

  def new
    @post = Post.new
    @destinations = Destination.all
    respond_to do |f|
        f.html { render :new }
        f.json { render :new}
      end
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      render json: @post
    else
      render json: @post.errors.full_messages, status: 422
    end
  end

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
    @post = Post.find_by(id: params[:id])
      if @post.update(post_params)
        redirect_to user_path(current_user)
      else
        @errors = @post.errors.full_messages
      render :edit
    end
  end


  private

  def post_params
    params.require(:post).permit(:title, :vacation_type, :total_cost, :flight, :climate, :car_rental, :diet, :content, :user_id, :avatar, :destination_id, :destination_attributes => [:name])
  end


end
