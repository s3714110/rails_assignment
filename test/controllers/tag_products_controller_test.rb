require 'test_helper'

class TagProductsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tag_product = tag_products(:one)
  end

  test "should get index" do
    get tag_products_url
    assert_response :success
  end

  test "should get new" do
    get new_tag_product_url
    assert_response :success
  end

  test "should create tag_product" do
    assert_difference('TagProduct.count') do
      post tag_products_url, params: { tag_product: { product_id: @tag_product.product_id, tag_id: @tag_product.tag_id } }
    end

    assert_redirected_to tag_product_url(TagProduct.last)
  end

  test "should show tag_product" do
    get tag_product_url(@tag_product)
    assert_response :success
  end

  test "should get edit" do
    get edit_tag_product_url(@tag_product)
    assert_response :success
  end

  test "should update tag_product" do
    patch tag_product_url(@tag_product), params: { tag_product: { product_id: @tag_product.product_id, tag_id: @tag_product.tag_id } }
    assert_redirected_to tag_product_url(@tag_product)
  end

  test "should destroy tag_product" do
    assert_difference('TagProduct.count', -1) do
      delete tag_product_url(@tag_product)
    end

    assert_redirected_to tag_products_url
  end
end
