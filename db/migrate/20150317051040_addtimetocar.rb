class Addtimetocar < ActiveRecord::Migration
  def change
    add_column :cars, :time, :integer
  end
end
