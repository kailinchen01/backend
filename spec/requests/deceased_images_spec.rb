require 'rails_helper'

RSpec.describe "DeceasedImages", type: :request do
  describe "Request Deceased Images API" do 
    before(:each) do
      User.create(name: "Test user")
      DeceasedPost.create(name: "Test Deceased")
      image1 = DeceasedImage.new
      filename = '1.jpg'
      image1.owner_id = 1
      image1.user_id = 1
      image1.file.attach(io: File.open(Rails.root.join('app', 'tmp', filename)), filename: filename)
      image1.save!

      image2 = DeceasedImage.new
      filename = '2.jpg'
      image2.owner_id = 1
      image2.user_id = 1
      image2.file.attach(io: File.open(Rails.root.join('app', 'tmp', filename)), filename: filename)
      image2.save!
    end


    it 'retrieve all deceased images' do
      get deceased_images_path   
      expect(response).to be_successful
      expect(response.body).to include("1.jpg") and include("2.jpg")
    end
    
  end
end
