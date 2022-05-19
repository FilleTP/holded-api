class RemoveColumnProposal < ActiveRecord::Migration[6.0]
  def change
    remove_column :proposals, :object_items
  end
end
