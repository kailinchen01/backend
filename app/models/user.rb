class User < ApplicationRecord
  has_one :profile_photo, as: :owner
  has_many :deceased_posts
  has_many :deceased_images, through: :deceased_posts

  has_many :reports
  has_many :place_images, through: :reports
end
