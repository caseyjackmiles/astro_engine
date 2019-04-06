require 'test_helper'

module AstroEngine
  class SunriseSunsetControllerTest < ActionDispatch::IntegrationTest
    include Engine.routes.url_helpers

    test "should get today" do
      get sunrise_sunset_today_url
      assert_response :success
    end

  end
end
