class CreateObjectItems < ActiveRecord::Migration[6.0]
  def change
    create_table :object_items do |t|

      t.timestamps
    end
  end
end
