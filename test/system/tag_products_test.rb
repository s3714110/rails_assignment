require "application_system_test_case"

class TagProductsTest < ApplicationSystemTestCase
  setup do
    @tag_product = tag_products(:one)
  end

  test "visiting the index" do
    visit tag_products_url
    assert_selector "h1", text: "Tag Products"
  end

  test "creating a Tag product" do
    visit tag_products_url
    click_on "New Tag Product"

    fill_in "Product", with: @tag_product.product_id
    fill_in "Tag", with: @tag_product.tag_id
    click_on "Create Tag product"

    assert_text "Tag product was successfully created"
    click_on "Back"
  end

  test "updating a Tag product" do
    visit tag_products_url
    click_on "Edit", match: :first

    fill_in "Product", with: @tag_product.product_id
    fill_in "Tag", with: @tag_product.tag_id
    click_on "Update Tag product"

    assert_text "Tag product was successfully updated"
    click_on "Back"
  end

  test "destroying a Tag product" do
    visit tag_products_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Tag product was successfully destroyed"
  end
end
