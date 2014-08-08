require 'test_helper'

class RipperControllerTest < ActionController::TestCase
  test "post with valid youtube id and bucket name should be successful" do
    post :create, {youtube_id: 'YQjrz23DUuA', bucket_name: 'jukinvideo_unit_tests'}
    assert_response :success
  end

  test "post with invalid youtube id should fail" do
    post :create, {youtube_id: 'bogus', bucket_name: 'jukinvideo_unit_tests'}, json: true
    json = ActiveSupport::JSON.decode @response.body
    puts ActiveSupport::JSON.decode @response.body
    assert json['exception'] =~ /Not Found/
    assert json['exception'] =~ /ArgumentError/
  end

  test "post with valid youtube id but invalid bucket should fail" do
    post :create, {youtube_id: 'YQjrz23DUuA', bucket_name: 'bogus_bucket_name'}, json: true
    json = ActiveSupport::JSON.decode @response.body
    assert json['exception'] =~ /does not exist/
  end
end
