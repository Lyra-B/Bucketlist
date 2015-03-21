class DestinationsController < ApplicationController
  def create
    @destination = Destination.find_or_create_by!(allowed_params)
    # binding.pry
    # render :partial => 'destinations/destination', :locals => { :destination => @destination }
    # render @destination
  end

  def destroy
    @destination = Destination.find(params[:id])
    @destination.destroy
  end

  private
  def allowed_params
    params.require(:destination).permit(:name, :image_url)
  end
end
