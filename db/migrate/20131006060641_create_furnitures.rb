class CreateFurnitures < ActiveRecord::Migration
  def change
    create_table :furnitures do |t|
      t.string :kind
      t.integer :height
      t.boolean :emergency_exit
      t.boolean :openable
      t.timestamps
    end
  end
end
