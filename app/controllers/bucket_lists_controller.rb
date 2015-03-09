class BucketListsController < ApplicationController
  @activities = current_traveller.activities.includes(:destination)
end
