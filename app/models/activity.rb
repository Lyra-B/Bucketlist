class Activity < ActiveRecord::Base
  belongs_to :destination
  has_many :bucket_list_items
  has_many :travellers, :through => :bucket_list_items

  accepts_nested_attributes_for :bucket_list_items

  geocoded_by :geocode_input
  before_save :geocode

  protected
  def geocode_input
    "#{self.location}, #{self.destination.name}"
    # [location, destination.name].join","
  end
end
