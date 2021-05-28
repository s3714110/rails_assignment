require "application_system_test_case"

class SizeProductsTest < ApplicationSystemTestCase
  setup do
    @size_product = size_products(:one)
  end

  test "visiting the index" do
    visit size_products_url
    assert_selector "h1", text: "Size Products"
  end

  test "creating a Size product" do
    visit size_products_url
    click_on "New Size Product"

    fill_in "Product", with: @size_product.product_id
    fill_in "Size", with: @size_product.size_id
    click_on "Create Size product"

    assert_text "Size product was successfully created"
    click_on "Back"
  end

  test "updating a Size product" do
    visit size_products_url
    click_on "Edit", match: :first

    fill_in "Product", with: @size_product.product_id
    fill_in "Size", with: @size_product.size_id
    click_on "Update Size product"

    assert_text "Size product was successfully updated"
    click_on "Back"
  end

  test "destroying a Size product" do
    visit size_products_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Size product was successfully destroyed"
  end
end
