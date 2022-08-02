class AddColumnUrlToProposal < ActiveRecord::Migration[6.0]
  def change
    add_column :proposals, :url, :string
  end
end
