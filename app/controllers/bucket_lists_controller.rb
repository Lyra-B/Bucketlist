class BucketListsController < ApplicationController
  def show
    @destination = Destination.new
    @destinations = Destination.all
    @activity = Activity.new
    @activities = current_traveller.activities.includes(:destination).order(:destination_id)
    @activities_objects = current_traveller.activities.all.to_json(:only=>[:latitude,:longitude, :name, :image_url])
    @destination.activities.map{ |a| a.destination }
    # @lats = Activity.all.map{|a| a.latitude}
    # @lngs = Activity.all.map{|a| a.longitude}
    # @names = Activity.all.map{|a| a.name}
    # @lat_lng_nam = [@lats, @lngs, @names].transpose.to_json
    # binding.pry
    # binding.pry
  end
end





