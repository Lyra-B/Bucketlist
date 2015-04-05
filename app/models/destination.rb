class Destination < ActiveRecord::Base
  has_many :activities

  validates :name, presence: true
  validates :image_url, presence: true
end
