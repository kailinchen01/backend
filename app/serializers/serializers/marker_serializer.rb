class MarkerSerializer < ActiveModel::Serializer
  attributes :id, :lonlat, :place_name
  has_many :report 
end
