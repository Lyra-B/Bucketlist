class AddNameAndImageUrl < ActiveRecord::Migration
  def change
    add_column :destinations, :name, :string
    add_column :destinations, :image_url, :string
  end
end
