class AddTravellerIdToBucketListItem < ActiveRecord::Migration
  def change
        add_column :bucket_list_items, :traveller_id, :integer
  end
end
