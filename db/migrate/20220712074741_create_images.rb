class CreateImages < ActiveRecord::Migration[7.0]
  def change
    create_table :images do |t|
      t.string :type
      t.references :owner, null: true, polymorphic: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
