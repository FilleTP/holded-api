class CreateCustomers < ActiveRecord::Migration[6.0]
  def change
    create_table :customers do |t|
      t.string :name
      t.string :code
      t.string :email
      t.string :mobile
      t.string :phone

      t.timestamps
    end
  end
end
