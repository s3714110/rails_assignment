require 'test_helper'

class ColorProductsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @color_product = color_products(:one)
  end

  test "should get index" do
    get color_products_url
    assert_response :success
  end

  test "should get new" do
    get new_color_product_url
    assert_response :success
  end

  test "should create color_product" do
    assert_difference('ColorProduct.count') do
      post color_products_url, params: { color_product: { color_id: @color_product.color_id, product_id: @color_product.product_id } }
    end

    assert_redirected_to color_product_url(ColorProduct.last)
  end

  test "should show color_product" do
    get color_product_url(@color_product)
    assert_response :success
  end

  test "should get edit" do
    get edit_color_product_url(@color_product)
    assert_response :success
  end

  test "should update color_product" do
    patch color_product_url(@color_product), params: { color_product: { color_id: @color_product.color_id, product_id: @color_product.product_id } }
    assert_redirected_to color_product_url(@color_product)
  end

  test "should destroy color_product" do
    assert_difference('ColorProduct.count', -1) do
      delete color_product_url(@color_product)
    end

    assert_redirected_to color_products_url
  end
end
