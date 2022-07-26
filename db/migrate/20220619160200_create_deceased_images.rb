class CreateDeceasedImages < ActiveRecord::Migration[7.0]
  def change
    create_table :deceased_images do |t|
      t.belongs_to :deceased_post, null: true, foreign_key: true
      t.belongs_to :user, through: :deceased_post

      t.timestamps
    end
  end
end
