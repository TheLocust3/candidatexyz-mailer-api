require 'test_helper'

class MailControllerTest < ActionDispatch::IntegrationTest
  setup do
    @auth_headers = authenticate_test[:headers]
  end

  test "shouldn't mail as company without authentication" do
    post '/company'

    assert_response :unauthorized
  end

  test "shouldn't mail as campaign without authentication" do
    post '/campaign'

    assert_response :unauthorized
  end

  test "shouldn't mail as campaign to many without authentication" do
    post '/campaign_many'

    assert_response :unauthorized
  end
end
