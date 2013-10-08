class DeleteRecords < ActiveRecord::Migration
  def up
   Furniture.delete_all
   FilterResult.delete_all
   Temp.delete_all
  end

  def down
  end
end
