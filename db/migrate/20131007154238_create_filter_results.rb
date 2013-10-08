class CreateFilterResults < ActiveRecord::Migration
  def change
    create_table :filter_results do |t|
      t.string :kind
      t.integer :height
      t.boolean :emergency_exit
      t.boolean :openable
      t.integer :filter_id
      t.timestamps
    end
  end
end
