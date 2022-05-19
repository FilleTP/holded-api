class RemoveReferenceProposalPvgi < ActiveRecord::Migration[6.0]
  def change
    remove_reference :pvgis, :propsal, index: true
  end
end
