class ActivitiesController < ApplicationController
  def create
    @activity = Activity.create!(allowed_params)
    # @lats = Activity.all.map{|a| a.latitude}
    # @lngs = Activity.all.map{|a| a.longitude}
    # @names = Activity.all.map{|a| a.name}
    # @activities = current_traveller.activities.all.to_json(:only=>[:latitude,:longitude, :name])
    # binding.pry
    # @lat_lng_nam = [@lats, @lngs, @names].transpose
    # binding.pry
    # render @activity
    # render :partial => 'activities/activity', :locals => { :activity => @activity }
    # binding.pry
  end

  def index
    render :json => Activity.all.to_json(:only=>[:latitude,:longitude, :name])
  end

  def order
    # binding.pry
  end

  def destroy
    @activity = Activity.find(params[:id])
    @activity.destroy
  end

  def allowed_params
    params.require(:activity).permit(:name, :image_url, :location, :destination_id, :bucket_list_items_attributes => [:traveller_id])
  end
end
