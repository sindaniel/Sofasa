class AddPriorityToPictures < ActiveRecord::Migration
  def change
    add_column :pictures, :priority, :integer
  end
end
