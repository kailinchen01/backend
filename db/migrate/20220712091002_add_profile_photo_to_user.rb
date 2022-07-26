class AddProfilePhotoToUser < ActiveRecord::Migration[7.0]
  def change
    add_reference :users, :profile_photo, null: true, as: :owner
  end
end
