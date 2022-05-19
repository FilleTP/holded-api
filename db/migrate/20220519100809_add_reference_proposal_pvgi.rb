class AddReferenceProposalPvgi < ActiveRecord::Migration[6.0]
  def change
    add_reference :pvgis, :proposal, index: true
  end
end
