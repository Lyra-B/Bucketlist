class BucketListsController < ApplicationController
  def show
    @destination = Destination.new
    @destinations = Destination.all
    @activity = Activity.new
    # @activities = current_traveller.activities.includes(:destination).order(:priority)
    @activities_objects = current_traveller.activities.all.to_json(:only=>[:latitude,:longitude, :name, :image_url])
    @destination.activities.map{ |a| a.destination }
    @priorities = Activity.priorities
  end

  def order
    @priorities = Activity.priorities
    @destinations = Destination.includes(:activities)
    if params[:order] == "Most Recently Added"
      @order = "created_at".to_sym
    else
      @order = params[:order].downcase.to_sym
    end
  end
end





