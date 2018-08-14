require 'test_helper'

class MailControllerTest < ActionDispatch::IntegrationTest
  setup do
    @auth_headers = authenticate_test[:headers]
  end

  test 'should mail as company with authentication' do
    post '/company', :params => { email: 'test@gmail.com', subject: 'Subject', body: 'A body' }, :headers => @auth_headers, :as => :json

    assert_response :success
  end

  test "shouldn't mail as company without authentication" do
    post '/company'

    assert_response :unauthorized
  end

  test 'should mail as campaign with authentication' do
    post '/campaign', :params => { email: 'test@gmail.com', subject: 'Subject', body: 'A body' }, :headers => @auth_headers, :as => :json

    assert_response :success
  end

  test "shouldn't mail as campaign without authentication" do
    post '/campaign'

    assert_response :unauthorized
  end

  test 'should mail as campaign to many with authentication' do
    post '/campaign_many', :params => { emails: ['test@gmail.com', 'jake.kinsella@gmail.com'], subject: 'Subject', body: 'A body' }, :headers => @auth_headers, :as => :json

    assert_response :success
  end

  test "shouldn't mail as campaign to many without authentication" do
    post '/campaign_many'

    assert_response :unauthorized
  end
end
