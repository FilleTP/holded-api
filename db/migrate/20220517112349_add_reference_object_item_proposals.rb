class AddReferenceObjectItemProposals < ActiveRecord::Migration[6.0]
  def change
    add_reference :object_items, :propsal, index: true
  end
end
