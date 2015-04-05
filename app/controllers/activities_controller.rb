class ActivitiesController < ApplicationController
  def create
    @activity = Activity.create!(allowed_params)
  end

  def index
    render :json => Activity.all.to_json(:only=>[:latitude,:longitude, :name])
  end

  # def order
  # end

  def destroy
    @activity = Activity.find(params[:id])
    @activity.destroy
  end

  def allowed_params
    params.require(:activity).permit(:name, :image_url, :location, :priority, :destination_id, :bucket_list_items_attributes => [:traveller_id])
  end
end
