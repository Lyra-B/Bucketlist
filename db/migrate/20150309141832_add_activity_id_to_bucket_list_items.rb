class AddActivityIdToBucketListItems < ActiveRecord::Migration
  def change
    add_column :bucket_list_items, :activity_id, :integer
  end
end
