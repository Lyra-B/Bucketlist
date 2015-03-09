class CreateBucketListItems < ActiveRecord::Migration
  def change
    create_table :bucket_list_items do |t|

      t.timestamps null: false
    end
  end
end
