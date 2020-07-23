require 'test_helper'

class LocationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @location = locations(:one)
  end

  test "should get index" do
    get locations_url
    assert_response :success
  end

  test "should get new" do
    get new_location_url
    assert_response :success
  end

  test "should create location" do
    assert_difference('Location.count') do
      post locations_url, params: { location: { address: @location.address, beer: @location.beer, latitude: @location.latitude, license: @location.license, license_type: @location.license_type, liquor: @location.liquor, longitude: @location.longitude, name: @location.name, phone: @location.phone, wine: @location.wine } }
    end

    assert_redirected_to location_url(Location.last)
  end

  test "should show location" do
    get location_url(@location)
    assert_response :success
  end

  test "should get edit" do
    get edit_location_url(@location)
    assert_response :success
  end

  test "should update location" do
    patch location_url(@location), params: { location: { address: @location.address, beer: @location.beer, latitude: @location.latitude, license: @location.license, license_type: @location.license_type, liquor: @location.liquor, longitude: @location.longitude, name: @location.name, phone: @location.phone, wine: @location.wine } }
    assert_redirected_to location_url(@location)
  end

  test "should destroy location" do
    assert_difference('Location.count', -1) do
      delete location_url(@location)
    end

    assert_redirected_to locations_url
  end
end
