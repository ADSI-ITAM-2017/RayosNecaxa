class RemoveFecharesFromLike < ActiveRecord::Migration[5.0]
  def change
    remove_column :likes, :fechares, :date
  end
end
