module PostsHelper

  def both_destinations?(params)
    binding.pry
    !params[:destination_attributes][:name].empty? && !params[:destination_id].empty? ||
    params[:destination_attributes][:name].empty? && params[:destination_id].empty?
  end



end
