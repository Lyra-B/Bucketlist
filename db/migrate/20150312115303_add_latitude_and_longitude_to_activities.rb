class AddLatitudeAndLongitudeToActivities < ActiveRecord::Migration
  def change
    add_column :activities, :latitude, :decimal
    add_column :activities, :longitude, :decimal
  end
end
