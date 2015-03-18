class AddRelation < ActiveRecord::Migration
  def change
    change_table :pictures do |t|
      t.belongs_to :car
    end
  end
end
