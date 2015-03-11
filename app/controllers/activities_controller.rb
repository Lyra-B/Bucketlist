class ActivitiesController < ApplicationController
  def create
    @activity = Activity.create!(allowed_params)
    # binding.pry
    # render @activity
    # render :partial => 'activities/activity', :locals => { :activity => @activity }
  end

  def allowed_params
    params.require(:activity).permit(:name, :image_url, :destination_id, :bucket_list_items_attributes => [:traveller_id])
  end
end
