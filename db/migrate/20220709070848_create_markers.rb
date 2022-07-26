class CreateMarkers < ActiveRecord::Migration[7.0]
  def change
    create_table :markers do |t|
      t.string :lonlat, null: false
      t.string :place_name

      t.timestamps
    end
  end
end
