class Report < ApplicationRecord
  belongs_to :marker, optional: true
  belongs_to :user
  has_many :place_images, as: :owner

  def place_image_urls
    place_images.map{|image| image.url}
  end
end
