require 'rails_helper'

RSpec.describe "DeceasedPosts", type: :request do
  describe "Request Post API" do 
    before(:each) do
      User.create(name: "Test user")
      DeceasedPost.create(name: "Test Deceased 1", user_id: 1)
      DeceasedPost.create(name: "Test Deceased 2", user_id: 1)
    end


    it 'retrieve all deceased posts' do
      get "/deceased_posts?start=1&end=2"   
      expect(response).to be_successful
      expect(response.body).to include("Test Deceased 1") and include("Test Deceased 2")
    end

    it 'retrieve a specific deceased post' do
      get deceased_post_path(1)
      expect(response).to be_successful
      expect(response.body).to include("Test Deceased 1") and !include("Test Deceased 2")
    end


  end

  describe "Add Post API" do 
    before(:each) do
      User.create(name: "Test user")
      image = DeceasedImage.new
      filename = '1.jpg'
      image.user_id = 1
      image.file.attach(io: File.open(Rails.root.join('app', 'tmp', filename)), filename: filename)
      image.save!
    end

    it 'add a single deceased post' do
      post '/deceased_posts', params: {
        deceased_post: {
          user_id: 1,
          name: "Test Deceased 3",
          gender: "Male",
          age_range: "Test Age",
          date_of_birth: Date.today,
          date_found: Date.today,
          location: "Test Location",
          vague_location: "Test Vague",
          hair_length: "Test Length",
          hair_color: "Test Color",
          skin_color: "Test Skin Color",
          description: "Test Description",
          ethnicity: "Test Ethinicity",
          lat: 1.1,
          lng: 1.2,
          deceased_image_ids: [1]
      
        }
      }
      # 201 Created Post
      expect(response.status).to eq(201)

    end

    # it 'add a single deceased post without location' do
    #   post '/deceased_posts', params: {
    #     deceased_post: {
    #       user_id: 1,
    #       name: "Test Deceased 3",
    #       gender: "Male",
    #       age_range: "Test Age"
    #       date_of_birth: Time.now,
    #       date_found: Time.now,
    #       vague_location: "Test Vague",
    #       hair_length: "Test Length",
    #       hair_color: "Test Color",
    #       skin_color: "Test Skin Color",
    #       description: "Test Description",
    #       ethnicity: "Test Ethinicity",
    #       deceased_image_ids: [1]
    #     }
    #   }
    #   # 201 Validation Error
    #   expect(response.status).to eq(400)
    # end


  end

end
