class ChangeTableNameObjectItem < ActiveRecord::Migration[6.0]
  def change
    rename_table :object_item, :objectitem
  end
end
