class BucketListsController < ApplicationController
  def show
    # @activities = current_traveller.activities.includes(:destination)
    @destination = Destination.new
    @destinations = Destination.all
    @activity = Activity.new
  end
end





