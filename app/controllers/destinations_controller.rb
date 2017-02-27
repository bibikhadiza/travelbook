class DestinationsController < ApplicationController
  before_action :find_destination



  def index
    render json: Destination.all
  end

  def show
    @des = Destination.find_by(id: params[:id])
    respond_to do |f|
        f.html { render :show }
        f.json { render json: @des, adapter: :json}
      end
  end


  def find_destination
    @destination = Destination.find_by(id: params[:id])
  end



end
