require "test_helper"

class IdeasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @idea = ideas(:one)
  end

  test "should get index" do
    get ideas_url, as: :json
    assert_response :success
  end

  test "should create idea" do
    assert_difference('Idea.count') do
      post ideas_url, params: { idea: { likes: @idea.likes, quote: @idea.quote } }, as: :json
    end

    assert_response 201
  end

  test "should show idea" do
    get idea_url(@idea), as: :json
    assert_response :success
  end

  test "should update idea" do
    patch idea_url(@idea), params: { idea: { likes: @idea.likes, quote: @idea.quote } }, as: :json
    assert_response 200
  end

  test "should destroy idea" do
    assert_difference('Idea.count', -1) do
      delete idea_url(@idea), as: :json
    end

    assert_response 204
  end
end
