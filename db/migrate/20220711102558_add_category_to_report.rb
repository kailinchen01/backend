class AddCategoryToReport < ActiveRecord::Migration[7.0]
  def change
    add_column :reports, :category, :string
  end
end
