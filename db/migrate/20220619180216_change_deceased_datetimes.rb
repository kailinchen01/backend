class ChangeDeceasedDatetimes < ActiveRecord::Migration[7.0]
  def change
    change_column :deceased_posts, :date_found, :date
    change_column :deceased_posts, :date_of_birth, :date
  end
end
