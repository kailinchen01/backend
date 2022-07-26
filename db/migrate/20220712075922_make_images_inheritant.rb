class MakeImagesInheritant < ActiveRecord::Migration[7.0]
  def change
    drop_table :deceased_images
    drop_table :place_images
  end
end
