module ApplicationHelper
  def make_activity(destination)
    activity = Activity.new(:destination => destination)
    activity.bucket_list_items.build(:traveller => current_traveller)
    activity
  end
end
