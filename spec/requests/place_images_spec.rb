require 'rails_helper'

RSpec.describe "PlaceImages", type: :request do
  describe "Request Place Images API" do 
    before(:each) do
      User.create(name: "Test user")
      marker = Marker.create(lonlat: "1.2,1.1")
      Report.create(user_id: 1, marker_id: 1, description: "Test Description", lonlat: marker.lonlat)

      image1 = PlaceImage.new
      filename = '3.jpg'
      image1.user_id = 1
      image1.file.attach(io: File.open(Rails.root.join('app', 'tmp', filename)), filename: filename)
      image1.save!

      image2 = PlaceImage.new
      filename = '4.jpg'
      image2.user_id = 1
      image2.file.attach(io: File.open(Rails.root.join('app', 'tmp', filename)), filename: filename)
      image2.save!
    end


    it 'retrieve all place images' do
      get place_images_path   
      expect(response).to be_successful
      expect(response.body).to include("3.jpg") and include("4.jpg")
    end
    
  end
end
