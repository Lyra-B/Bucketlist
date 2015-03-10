class DestinationsController < ApplicationController
  def create
    @destination = Destination.create!(allowed_params)
    # render :partial => 'destinations/destination', :locals => { :destination => @destination }
    render @destination
  end

  private
  def allowed_params
    params.require(:destination).permit(:name, :image_url)
  end
end
