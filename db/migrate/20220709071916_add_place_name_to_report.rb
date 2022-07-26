class AddPlaceNameToReport < ActiveRecord::Migration[7.0]
  def change
    add_column :reports, :place_name, :string
  end
end
