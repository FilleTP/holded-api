class AddColumnCustomer < ActiveRecord::Migration[6.0]
  def change
    add_column :customers, :type, :string
    add_column :customers, :is_person, :boolean
    add_column :customers, :iban, :string
    add_column :customers, :swift, :string
    add_column :customers, :sepa_ref, :string
    add_column :customers, :group_id, :integer
    add_column :customers, :tax_operation, :string
    add_column :customers, :sepa_date, :string
    add_column :customers, :client_record, :string
    add_column :customers, :supplier_record, :string
    add_column :customers, :bill_address, :string
    add_column :customers, :numbering_series, :string
    add_column :customers, :shipping_addresses, :string
    add_column :customers, :social_networks, :string
    add_column :customers, :website, :string
    add_column :customers, :tags, :string
    add_column :customers, :note, :text
    add_column :customers, :contact_persons, :string
  end
end
