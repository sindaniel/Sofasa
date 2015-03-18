class CreateGenerals < ActiveRecord::Migration
  def change
    create_table :generals do |t|
      t.string :key
      t.string :value

      t.timestamps
    end
  end
end
