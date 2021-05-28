require 'test_helper'

class SubimgsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @subimg = subimgs(:one)
  end

  test "should get index" do
    get subimgs_url
    assert_response :success
  end

  test "should get new" do
    get new_subimg_url
    assert_response :success
  end

  test "should create subimg" do
    assert_difference('Subimg.count') do
      post subimgs_url, params: { subimg: { product_id: @subimg.product_id, url: @subimg.url } }
    end

    assert_redirected_to subimg_url(Subimg.last)
  end

  test "should show subimg" do
    get subimg_url(@subimg)
    assert_response :success
  end

  test "should get edit" do
    get edit_subimg_url(@subimg)
    assert_response :success
  end

  test "should update subimg" do
    patch subimg_url(@subimg), params: { subimg: { product_id: @subimg.product_id, url: @subimg.url } }
    assert_redirected_to subimg_url(@subimg)
  end

  test "should destroy subimg" do
    assert_difference('Subimg.count', -1) do
      delete subimg_url(@subimg)
    end

    assert_redirected_to subimgs_url
  end
end
