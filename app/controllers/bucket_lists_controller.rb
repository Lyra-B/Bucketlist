class BucketListsController < ApplicationController
  def show
    @destination = Destination.new
    @destinations = Destination.all
    @activity = Activity.new
    @activities = current_traveller.activities.includes(:destination).order(:destination_id)
    @destination.activities.map{ |a| a.destination }
    # binding.pry
  end
end





