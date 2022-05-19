class AddReferencePvgiToProposal < ActiveRecord::Migration[6.0]
  def change
    add_reference :pvgis, :propsal, index: true
  end
end
