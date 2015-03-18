class AddPictureToPicture < ActiveRecord::Migration
  def change
    add_attachment :pictures, :picture1
    add_attachment :pictures, :picture2
    remove_column :pictures, :order
    add_column :pictures, :position, :integer
  end
end
