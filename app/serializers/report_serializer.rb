class ReportSerializer < ActiveModel::Serializer
  attributes :id, :lonlat, :user, :description, :category, :place_image_urls, :time
  has_one :user
  def time
    object.created_at
  end
end
