class AddPriorityToActivities < ActiveRecord::Migration
  def change
    add_column :activities, :priority, :integer
  end
end
