class DeceasedPostSerializer < ActiveModel::Serializer
  attributes :id, :name, :gender, :age, :date_of_birth, :date_found, :vague_location, :hair_length, :hair_color, :skin_color, :description, :posting_time, :ethnicity, :age_range, :lat, :lng, :ethnicity
  belongs_to :user
end
