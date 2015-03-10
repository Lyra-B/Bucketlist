class ActivitiesController < ApplicationController
  def create
    @activity = Activity.create!(allowed_params)
    render @activity
    # render :partial => 'activities/activity', :locals => { :activity => @activity }
  end

  def allowed_params
    params.require(:activity).permit(:name, :image_url, :destination_id)
  end
end
