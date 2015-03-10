class BucketListsController < ApplicationController
  def show
    @activities = current_traveller.activities.includes(:destination)
    @destination = Destination.new
  end
end
