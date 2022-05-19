class AddColumnsObjectItem < ActiveRecord::Migration[6.0]
  def change
    add_reference :proposals, :object_item, index: true
    add_column :object_items, :name, :string
    add_column :object_items, :desc, :string
    add_column :object_items, :units, :integer
    add_column :object_items, :subtotal, :float
    add_column :object_items, :discount, :integer
    add_column :object_items, :tax, :integer
    add_column :object_items, :retention, :integer
  end
end
