class Marker < ApplicationRecord
  has_many :reports, dependent: :destroy
end