class CreatePvgisdata < ActiveRecord::Migration[6.0]
  def change
    create_table :pvgisdata do |t|
      t.references :proposal, null: false, foreign_key: true
      t.float :lat
      t.float :lon
      t.float :peakpower
      t.float :angle
      t.float :loss
      t.float :slope
      t.string :azimuth
      t.timestamps
    end
  end
end
