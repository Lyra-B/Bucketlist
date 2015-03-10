class BucketListsController < ApplicationController
  def show
    @activities = current_traveller.activities.includes(:destination)
    @destination = Destination.new
    @destinations = current_traveller.destinations
    @activity = Activity.new
  end
end
