class ActivitiesController < ApplicationController
  def create
    @activity = Activity.create!(allowed_params)
    @lats = Activity.all.map{|a| a.latitude}
    @lngs = Activity.all.map{|a| a.longitude}
    @names = Activity.all.map{|a| a.name}
    @lat_lng_nam = [@lats, @lngs, @names].transpose
    # binding.pry
    # render @activity
    # render :partial => 'activities/activity', :locals => { :activity => @activity }
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
