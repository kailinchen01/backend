# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
#
(1..3).map do 
  User.create!
end

(1..3).map do |i|
  imageArray = ['deadbody1', 'deadbody2', 'deadbody3']
  image = DeceasedImage.new
  filename = imageArray[i-1] + '.jpg'
  image.user_id = i
  image.file.attach(io: File.open(Rails.root.join('app', 'tmp', filename)), filename: filename)
  image.save!
end

DeceasedPost.create!(
  user_id: 1,
  name: 'Mark Vira',
  gender: 'Male',
  age_range: '18-24',
  date_found: '2022-03-15',
  location: '8 Somapah Rd, Singapore 487372',
  vague_location: 'Singapore',
  description: 'Right hand only has four fingers, tattoo on right hand',
  skin_color: 'Pale'
)

DeceasedPost.create!(
  user_id: 2,
  name: ' Alexandra Vera',
  gender: 'Female',
  age_range: '18-24',
  date_found: '2022-03-15',
  location: 'KremenchukPoltava Oblast, Ukraine, 39600',
  vague_location: 'Ukraine',
  description: 'both arms severely bombed',
  hair_color: 'White'
)

DeceasedPost.create!(
  user_id: 2,
  name: ' Kuzma Maxim',
  gender: 'Male',
  age_range: '18-24',
  date_found: '2022-03-15',
  location: 'KremenchukPoltava Oblast, Ukraine, 39600',
  vague_location: 'Ukraine',
  description: 'multiple gun shots in stomach',
  hair_length: 'Ear'
)

DeceasedPost.create!(
  user_id: 2,
  name: 'Danilo Pavlo',
  gender: 'Male',
  age_range: '25-34',
  date_found: '2022-03-15',
  location: 'KremenchukPoltava Oblast, Ukraine, 39600',
  vague_location: 'Ukraine',
  description: 'Signs of strangling on neck, he have multiple rings on his hand'
)


(1..18).map do |i|
  markerArray = [
  "103.9078,1.3786", "103.7442,1.3778", "103.75,1.3833","103.8681,1.3844",
  "103.7525,1.3817","103.8719,1.3972","103.8692,1.3956","103.9072,1.39",
  "103.7364,1.3819","103.7969,1.4456","103.8942,1.3811","103.8972,1.3756","103.9,1.3833",
  "103.8764,1.39","103.7989,1.4533","103.9017,1.3761","103.7228,1.3342","103.7167,1.35"]
  Marker.create!(
    lonlat: markerArray[i-1]
  )
end


(1..3).map do |i|
  imageArray = ['placeimage1', 'placeimage2', 'placeimage3']
  image = PlaceImage.new
  filename = imageArray[i-1] + '.jpg'
  image.user_id = i
  image.file.attach(io: File.open(Rails.root.join('app', 'tmp', filename)), filename: filename)
  image.save!
end

Report.create!(
  marker_id: 1,
  user_id: 1,
  description: "Be careful, a few mines have been spotted here",
  category: "Unexploded Mines",
  lonlat: "103.9078,1.3786",
  place_image_ids: [4]
)

Report.create!(
  marker_id: 2,
  user_id: 2,
  description: "Rock blockage, This road cannot be accessed.",
  category: "Blocked Route",
  lonlat: "103.7442,1.3778",
  place_image_ids: [5]
)

Report.create!(
  marker_id: 3,
  user_id: 3,
  description: "Avoid here, might get bombed tomorrow",
  category: "Attacker(s) Spotted",
  lonlat: "103.75,1.3833",
  place_image_ids: [6]
)







