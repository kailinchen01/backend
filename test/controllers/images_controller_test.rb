require "test_helper"

class ImagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @deceased_image = images(:one)
  end

  test "should get index" do
    get deceasedImages_url, as: :json
    assert_response :success
  end

  test "should create deceased_image" do
    assert_difference("DeceasedImage.count") do
      post deceasedImages_url, params: { deceased_image: { deceased_post_id: @deceased_image.deceased_post_id, user_id: @deceased_image.user_id } }, as: :json
    end

    assert_response :created
  end

  test "should show deceased_image" do
    get deceasedImage_url(@deceased_image), as: :json
    assert_response :success
  end

  test "should update deceased_image" do
    patch deceasedImage_url(@deceased_image), params: { deceased_image: { deceased_post_id: @deceased_image.deceased_post_id, user_id: @deceased_image.user_id } }, as: :json
    assert_response :success
  end

  test "should destroy deceased_image" do
    assert_difference("DeceasedImage.count", -1) do
      delete deceasedImage_url(@deceased_image), as: :json
    end

    assert_response :no_content
  end
end
