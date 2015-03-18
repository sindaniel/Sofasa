class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.integer :position1
      t.integer :position2
      t.integer :order
      t.integer :time

      t.timestamps
    end
  end
end
