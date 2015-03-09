class Activity < ActiveRecord::Base
  belongs_to :destination
  has_many :bucket_list_items
end
