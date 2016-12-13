class PostsController < ApplicationController



  def new
    if params[:id]
      @destination = Destination.find_by(id: params[:id])
      @destination.posts.build
    else
      @destination = Destination.new
      @destination.posts.build
    end
  end



  def create
    @destination = Destination.find_by(name: params[:destination][:name])
    if @destination.update(location_params)
      redirect_to user_path(current_user)
    else
      render "new"
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

  def location_params
    params.require(:destination).permit(:name, :posts_attributes => [:title, :total_cost, :flight, :climate, :car_rental, :diet, :content, :user_id, :avatar, :id])
  end









end
