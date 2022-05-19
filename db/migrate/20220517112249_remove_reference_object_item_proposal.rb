class RemoveReferenceObjectItemProposal < ActiveRecord::Migration[6.0]
  def change
    remove_reference :proposals, :object_item, index: true
  end
end
