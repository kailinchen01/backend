class Image < ApplicationRecord
  belongs_to :owner, polymorphic: true, optional: true
  belongs_to :user
  has_one_attached :file

  include Rails.application.routes.url_helpers
  def url
    url_for(self.file)
  end
end
