require "application_system_test_case"

class ColorProductsTest < ApplicationSystemTestCase
  setup do
    @color_product = color_products(:one)
  end

  test "visiting the index" do
    visit color_products_url
    assert_selector "h1", text: "Color Products"
  end

  test "creating a Color product" do
    visit color_products_url
    click_on "New Color Product"

    fill_in "Color", with: @color_product.color_id
    fill_in "Product", with: @color_product.product_id
    click_on "Create Color product"

    assert_text "Color product was successfully created"
    click_on "Back"
  end

  test "updating a Color product" do
    visit color_products_url
    click_on "Edit", match: :first

    fill_in "Color", with: @color_product.color_id
    fill_in "Product", with: @color_product.product_id
    click_on "Update Color product"

    assert_text "Color product was successfully updated"
    click_on "Back"
  end

  test "destroying a Color product" do
    visit color_products_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Color product was successfully destroyed"
  end
end
