require "test_helper"

class SubwaysControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get subways_path
    assert_response :success
  end

  test "should get show" do
    get subway_url("RED")
    assert_response :success
  end

  test "index should get data for routes" do
    data = {"data" => [{"id" => 'RED', "attributes" => {"long_name" => 'Red Line'}}]}
    Mbta::Search.stubs(:get_subway_lines => MockFaradayResponse.new(200, data))
    get subways_path
    assert_equal(assigns(:data), data["data"])
    assert_equal(assigns(:errors).length, 0)
  end

  test "index should return errors" do
    data = {"errors" => [{"code" => 'Something went wrong'}]}
    Mbta::Search.stubs(:get_subway_lines => MockFaradayResponse.new(500, data))
    get subways_path
    assert_equal(assigns(:data), [])
    assert_equal(assigns(:errors), ['Something went wrong'])
  end

  test "show should get data for stops" do
    data = {"data" => [{"attributes" => {"name" => 'Alewife'}}]}
    Mbta::Search.stubs(:get_stops => MockFaradayResponse.new(200, data))
    get subway_path("RED")
    assert_equal(assigns(:data), data["data"])
    assert_equal(assigns(:errors).length, 0)
  end

  test "show should return errors" do
    data = {"errors" => [{"code" => 'Something went wrong'}]}
    Mbta::Search.stubs(:get_stops => MockFaradayResponse.new(500, data))
    get subway_path("RED")
    assert_equal(assigns(:data), [])
    assert_equal(assigns(:errors), ['Something went wrong'])
  end
end
