require "test_helper"

class ThinkersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @thinker = thinkers(:one)
  end

  test "should get index" do
    get thinkers_url, as: :json
    assert_response :success
  end

  test "should create thinker" do
    assert_difference('Thinker.count') do
      post thinkers_url, params: { thinker: { category_id: @thinker.category_id, image: @thinker.image, name: @thinker.name, thimes_studied: @thinker.thimes_studied } }, as: :json
    end

    assert_response 201
  end

  test "should show thinker" do
    get thinker_url(@thinker), as: :json
    assert_response :success
  end

  test "should update thinker" do
    patch thinker_url(@thinker), params: { thinker: { category_id: @thinker.category_id, image: @thinker.image, name: @thinker.name, thimes_studied: @thinker.thimes_studied } }, as: :json
    assert_response 200
  end

  test "should destroy thinker" do
    assert_difference('Thinker.count', -1) do
      delete thinker_url(@thinker), as: :json
    end

    assert_response 204
  end
end
