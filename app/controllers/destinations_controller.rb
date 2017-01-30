class DestinationsController < ApplicationController
  before_action :find_destination



  def index
    arr = []
    Destination.all.each do |des|
      hash = {title: des.name}
      arr << hash
    end
    render json: arr
  end


  def show
    if @destination && @destination.posts.present?
      @destination_posts = @destination.posts
    else
      flash[:notice] = "This destination does not have any posts"
    end
  end



  def find_destination
    @destination = Destination.find_by(id: params[:id])
  end



end
