require "test_helper"

class ProfilePhotosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @profile_photo = profile_photos(:one)
  end

  test "should get index" do
    get profile_photos_url, as: :json
    assert_response :success
  end

  test "should create profile_photo" do
    assert_difference("ProfilePhoto.count") do
      post profile_photos_url, params: { profile_photo: { file: @profile_photo.file } }, as: :json
    end

    assert_response :created
  end

  test "should show profile_photo" do
    get profile_photo_url(@profile_photo), as: :json
    assert_response :success
  end

  test "should update profile_photo" do
    patch profile_photo_url(@profile_photo), params: { profile_photo: { file: @profile_photo.file } }, as: :json
    assert_response :success
  end

  test "should destroy profile_photo" do
    assert_difference("ProfilePhoto.count", -1) do
      delete profile_photo_url(@profile_photo), as: :json
    end

    assert_response :no_content
  end
end
