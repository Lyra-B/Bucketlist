class BucketListItem < ActiveRecord::Base
  belongs_to :activity
  belongs_to :traveller
end
