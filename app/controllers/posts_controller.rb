class PostsController < ApplicationController



  def new
    @post = Post.new
    @destinations = Destination.all
    @post.destination.build
  end



  def create
    if params["post"]["destination_attributes"]["name"] != ""
      @post = Post.create(input_destination_params)
      @posts = @post.destination.posts
      respond_to do |f|
          f.html { render :show }
          f.json { render json: @posts, adapter: :json}
      end
    else
      @post = Post.create(selected_destination_params)
      @posts = @post.destination.posts
      respond_to do |f|
          f.html { render :show }
          f.json { render json: @posts, adapter: :json}
        end
    else
       format.html { render action: 'new' }
      end
    end
  end




  # def create
  #   @destination = Destination.find_by(name: params[:destination][:name])
  #   if @destination.update(location_params)
  #     binding.pry
  #     @posts = @destination.posts
  #     respond_to do |f|
  #         f.html { render :show }
  #         f.json { render json: @posts, adapter: :json}
  #
  #       end
  #   else
  #     render "new"
  #   end
  # end


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

  def input_destination_params
    params.require(:post).permit(:title, :total_cost, :flight, :climate, :car_rental, :diet, :content, :user_id, :avatar, :destination_attributes => [:name])
  end

  def selected_destination_params
    params.require(:post).permit(:title, :total_cost, :flight, :climate, :car_rental, :diet, :content, :user_id, :avatar, :destination_id)
  end



end
