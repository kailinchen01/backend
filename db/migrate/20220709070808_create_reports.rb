class CreateReports < ActiveRecord::Migration[7.0]
  def change
    create_table :reports do |t|
      t.references :user, null: false , foreign_key: true
      t.references :marker, null: false , foreign_key: true
      t.string :lonlat, null: false
      t.text :description

      t.timestamps
    end
  end
end
