class DropTableObjectItem < ActiveRecord::Migration[6.0]
  def change
    drop_table :objectitem
  end
end
