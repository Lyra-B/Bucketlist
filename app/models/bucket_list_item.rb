class BucketListItem < ActiveRecord::Base
  belongs_to :activity
  belongs_to :traveller

  # accepts_nested_attributes_for :activities
  # before_create :build_activities
end
