require 'rails_helper'

RSpec.describe "Reports", type: :request do

  before(:each) do
    User.create(name: "Test user 1")
    User.create(name: "Test user 2")
    marker = Marker.create(lonlat: "1.2,3.1")
    Report.create(user_id: 1, description: "Describe 1", marker_id: 1, lonlat: marker.lonlat)
    Report.create(user_id: 2, description: "Describe 2", marker_id: 1, lonlat: marker.lonlat)
  end

  describe "Request Report API" do
    
    it 'retrieve all reports of a marker' do
      get "/markers/1/reports"  
      expect(response).to be_successful
      expect(response.body).to include("user 1") and include("user 2")
    end

  end

  describe "Add Report API" do

    it 'add a single report to a marker' do
      post '/reports', params: {
        report: {
          user_id: 1,
          lonlat: "1.2,1.3",
          marker_id: 1,
          description: "Test Description"
        }
      }
      # 201 Created Report
      expect(response.status).to eq(201)
    end

  end

end
