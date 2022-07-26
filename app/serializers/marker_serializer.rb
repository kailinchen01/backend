class MarkerSerializer < ActiveModel::Serializer
  attributes :id, :lonlat, :place_name
end
