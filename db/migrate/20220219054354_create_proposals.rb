class CreateProposals < ActiveRecord::Migration[6.0]
  def change
    create_table :proposals do |t|
      t.references :customer, null: false, foreign_key: true
      t.string :name
      t.string :date
      t.string :due_date
      t.string :object_items
      t.string :shipping_address
      t.string :postal_code
      t.string :shipping_city
      t.string :shipping_province
      t.string :shipping_country
      t.string :sales_channel
      t.string :contact_name
      t.string :contact_email
      t.string :contact_address
      t.string :contact_city
      t.string :contact_cp
      t.string :contact_province
      t.string :contact_country
      t.string :contact_country_code
      t.text :decription
      t.text :notes
      t.string :sales_channel_id
      t.string :payment_method
      t.string :design_id
      t.string :language
      t.string :warehouse_id
      t.string :quote_num
      t.string :num_serield
      t.string :currency
      t.string :currency_change
      t.timestamps
    end
  end
end
