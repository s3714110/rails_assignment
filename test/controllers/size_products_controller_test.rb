require 'test_helper'

class SizeProductsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @size_product = size_products(:one)
  end

  test "should get index" do
    get size_products_url
    assert_response :success
  end

  test "should get new" do
    get new_size_product_url
    assert_response :success
  end

  test "should create size_product" do
    assert_difference('SizeProduct.count') do
      post size_products_url, params: { size_product: { product_id: @size_product.product_id, size_id: @size_product.size_id } }
    end

    assert_redirected_to size_product_url(SizeProduct.last)
  end

  test "should show size_product" do
    get size_product_url(@size_product)
    assert_response :success
  end

  test "should get edit" do
    get edit_size_product_url(@size_product)
    assert_response :success
  end

  test "should update size_product" do
    patch size_product_url(@size_product), params: { size_product: { product_id: @size_product.product_id, size_id: @size_product.size_id } }
    assert_redirected_to size_product_url(@size_product)
  end

  test "should destroy size_product" do
    assert_difference('SizeProduct.count', -1) do
      delete size_product_url(@size_product)
    end

    assert_redirected_to size_products_url
  end
end
