class AddFieldsToDeceasedPost < ActiveRecord::Migration[7.0]
  def change
    add_column :deceased_posts, :ethnicity, :string
    add_column :deceased_posts, :age_range, :string
    add_column :deceased_posts, :lat, :float
    add_column :deceased_posts, :lng, :float

  end
end
