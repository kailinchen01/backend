class DeceasedPost < ApplicationRecord
  belongs_to :user
  has_many :deceased_images, as: :owner

  def posting_time
    self.created_at
  end
end
