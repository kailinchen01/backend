require "test_helper"

class DeceasedPostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @deceased_post = deceased_posts(:one)
  end

  test "should get index" do
    get deceased_posts_url, as: :json
    assert_response :success
  end

  test "should create deceased_post" do
    assert_difference("DeceasedPost.count") do
      post deceased_posts_url, params: { deceased_post: { age: @deceased_post.age, date_found: @deceased_post.date_found, date_of_birth: @deceased_post.date_of_birth, description: @deceased_post.description, gender: @deceased_post.gender, hair_color: @deceased_post.hair_color, hair_length: @deceased_post.hair_length, location: @deceased_post.location, name: @deceased_post.name, skin_color: @deceased_post.skin_color, user_id: @deceased_post.user_id, vague_location: @deceased_post.vague_location } }, as: :json
    end

    assert_response :created
  end

  test "should show deceased_post" do
    get deceased_post_url(@deceased_post), as: :json
    assert_response :success
  end

  test "should update deceased_post" do
    patch deceased_post_url(@deceased_post), params: { deceased_post: { age: @deceased_post.age, date_found: @deceased_post.date_found, date_of_birth: @deceased_post.date_of_birth, description: @deceased_post.description, gender: @deceased_post.gender, hair_color: @deceased_post.hair_color, hair_length: @deceased_post.hair_length, location: @deceased_post.location, name: @deceased_post.name, skin_color: @deceased_post.skin_color, user_id: @deceased_post.user_id, vague_location: @deceased_post.vague_location } }, as: :json
    assert_response :success
  end

  test "should destroy deceased_post" do
    assert_difference("DeceasedPost.count", -1) do
      delete deceased_post_url(@deceased_post), as: :json
    end

    assert_response :no_content
  end
end
