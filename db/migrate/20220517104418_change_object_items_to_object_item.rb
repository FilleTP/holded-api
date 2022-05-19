class ChangeObjectItemsToObjectItem < ActiveRecord::Migration[6.0]
  def change
    rename_table :object_items, :object_item
  end
end
