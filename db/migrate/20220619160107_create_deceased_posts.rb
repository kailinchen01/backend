class CreateDeceasedPosts < ActiveRecord::Migration[7.0]
  def change
    create_table :deceased_posts do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.string :name
      t.string :gender
      t.integer :age
      t.datetime :date_of_birth
      t.datetime :date_found
      t.string :location
      t.string :vague_location
      t.string :hair_length
      t.string :hair_color
      t.string :skin_color
      t.text :description

      t.timestamps
    end
  end
end
