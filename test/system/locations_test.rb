require "application_system_test_case"

class LocationsTest < ApplicationSystemTestCase
  setup do
    @location = locations(:one)
  end

  test "visiting the index" do
    visit locations_url
    assert_selector "h1", text: "Locations"
  end

  test "creating a Location" do
    visit locations_url
    click_on "New Location"

    fill_in "Address", with: @location.address
    check "Beer" if @location.beer
    fill_in "Latitude", with: @location.latitude
    fill_in "License", with: @location.license
    fill_in "License type", with: @location.license_type
    check "Liquor" if @location.liquor
    fill_in "Longitude", with: @location.longitude
    fill_in "Name", with: @location.name
    fill_in "Phone", with: @location.phone
    check "Wine" if @location.wine
    click_on "Create Location"

    assert_text "Location was successfully created"
    click_on "Back"
  end

  test "updating a Location" do
    visit locations_url
    click_on "Edit", match: :first

    fill_in "Address", with: @location.address
    check "Beer" if @location.beer
    fill_in "Latitude", with: @location.latitude
    fill_in "License", with: @location.license
    fill_in "License type", with: @location.license_type
    check "Liquor" if @location.liquor
    fill_in "Longitude", with: @location.longitude
    fill_in "Name", with: @location.name
    fill_in "Phone", with: @location.phone
    check "Wine" if @location.wine
    click_on "Update Location"

    assert_text "Location was successfully updated"
    click_on "Back"
  end

  test "destroying a Location" do
    visit locations_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Location was successfully destroyed"
  end
end
