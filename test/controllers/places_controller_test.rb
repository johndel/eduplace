require 'test_helper'

class PlacesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @place = places(:one)
  end

  test "should get index" do
    get places_url
    assert_response :success
  end

  test "should get new" do
    get new_place_url
    assert_response :success
  end

  test "should create place" do
    assert_difference('Place.count') do
      post places_url, params: { place: { address: @place.address, amea: @place.amea, city: @place.city, county: @place.county, edutype: @place.edutype, fax: @place.fax, name: @place.name, permission_code: @place.permission_code, phone: @place.phone, postal_code: @place.postal_code, site: @place.site, title: @place.title, trainee_capacity: @place.trainee_capacity } }
    end

    assert_redirected_to place_url(Place.last)
  end

  test "should show place" do
    get place_url(@place)
    assert_response :success
  end

  test "should get edit" do
    get edit_place_url(@place)
    assert_response :success
  end

  test "should update place" do
    patch place_url(@place), params: { place: { address: @place.address, amea: @place.amea, city: @place.city, county: @place.county, edutype: @place.edutype, fax: @place.fax, name: @place.name, permission_code: @place.permission_code, phone: @place.phone, postal_code: @place.postal_code, site: @place.site, title: @place.title, trainee_capacity: @place.trainee_capacity } }
    assert_redirected_to place_url(@place)
  end

  test "should destroy place" do
    assert_difference('Place.count', -1) do
      delete place_url(@place)
    end

    assert_redirected_to places_url
  end
end
