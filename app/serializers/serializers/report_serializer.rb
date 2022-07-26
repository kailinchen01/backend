class ReportSerializer < ActiveModel::Serializer
  attributes :id, :lonlat, :user, :description, :image_ids
  #belongs_to :user_id 
  has_many :image_ids
end
