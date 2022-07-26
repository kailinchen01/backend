class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :profile_photo_url
  def profile_photo_url
    if object.profile_photo
      object.profile_photo.url
    end

  end
end
