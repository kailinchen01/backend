require 'rails_helper'

RSpec.describe "Markers", type: :request do


  describe "Request Marker API" do 
    before(:each) do
      User.create(name: "Test user")
      Marker.create(lonlat: "1.2,1.1")
      Marker.create(lonlat: "2.1,2.2")
    end


    it 'retrieve all markers' do
      get "/markers"   
      expect(response).to be_successful
      expect(response.body).to include("2.1,2.2") and include("1.2,1.1")
    end

    it 'retrieve first marker' do
      get "/markers/1"   
      expect(response).to be_successful
      expect(response.body).to include("1.2,1.1") and !include("2.1,2.2")
    end
    
  end  

  describe "Add Marker API" do 

    before(:each) do
      User.create(name: "Test user")
    end

    it 'add a single marker' do
      post '/markers', params: {
        marker: {
          lonlat: "3.1,3.2",
          place_name: "Test name"
        }
      }
      # 201 Created Marker
      expect(response.status).to eq(201)
  
    end


  end
end
