require "application_system_test_case"

class SubimgsTest < ApplicationSystemTestCase
  setup do
    @subimg = subimgs(:one)
  end

  test "visiting the index" do
    visit subimgs_url
    assert_selector "h1", text: "Subimgs"
  end

  test "creating a Subimg" do
    visit subimgs_url
    click_on "New Subimg"

    fill_in "Product", with: @subimg.product_id
    fill_in "Url", with: @subimg.url
    click_on "Create Subimg"

    assert_text "Subimg was successfully created"
    click_on "Back"
  end

  test "updating a Subimg" do
    visit subimgs_url
    click_on "Edit", match: :first

    fill_in "Product", with: @subimg.product_id
    fill_in "Url", with: @subimg.url
    click_on "Update Subimg"

    assert_text "Subimg was successfully updated"
    click_on "Back"
  end

  test "destroying a Subimg" do
    visit subimgs_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Subimg was successfully destroyed"
  end
end
