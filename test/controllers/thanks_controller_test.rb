require 'test_helper'

class ThanksControllerTest < ActionController::TestCase
  test 'should get index with person' do
    session[:person_id] = Fabricate(:person).id

    get :index
    assert_response :success
  end

  test 'should get redirected without person' do
    get :index
    assert_redirected_to root_url
  end
end
