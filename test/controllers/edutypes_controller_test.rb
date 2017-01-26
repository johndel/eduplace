require 'test_helper'

class EdutypesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @edutype = edutypes(:one)
  end

  test "should get index" do
    get edutypes_url
    assert_response :success
  end

  test "should get new" do
    get new_edutype_url
    assert_response :success
  end

  test "should create edutype" do
    assert_difference('Edutype.count') do
      post edutypes_url, params: { edutype: { name: @edutype.name } }
    end

    assert_redirected_to edutype_url(Edutype.last)
  end

  test "should show edutype" do
    get edutype_url(@edutype)
    assert_response :success
  end

  test "should get edit" do
    get edit_edutype_url(@edutype)
    assert_response :success
  end

  test "should update edutype" do
    patch edutype_url(@edutype), params: { edutype: { name: @edutype.name } }
    assert_redirected_to edutype_url(@edutype)
  end

  test "should destroy edutype" do
    assert_difference('Edutype.count', -1) do
      delete edutype_url(@edutype)
    end

    assert_redirected_to edutypes_url
  end
end
