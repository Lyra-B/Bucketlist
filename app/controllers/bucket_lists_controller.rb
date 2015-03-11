class BucketListsController < ApplicationController
  def show
    @activities = current_traveller.activities.includes(:destination).order(:destination_id)
    @destination = Destination.new
    @destinations = Destination.all
    @destination.activities.map { |a| a.destination}
    @activity = Activity.new
  end
end





