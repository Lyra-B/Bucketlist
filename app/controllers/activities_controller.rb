class ActivitiesController < ApplicationController
  def create
    @activity = Activity.create!(allowed_params)
    # binding.pry
    # render @activity
    # render :partial => 'activities/activity', :locals => { :activity => @activity }
  end

  def destroy
    @activity = Activity.find(params[:id])
    @activity.destroy
  end

  def allowed_params
    params.require(:activity).permit(:name, :image_url, :location, :destination_id, :bucket_list_items_attributes => [:traveller_id])
  end
end
