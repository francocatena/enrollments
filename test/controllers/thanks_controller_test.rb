require 'test_helper'

class ThanksControllerTest < ActionController::TestCase
  test 'should get thanks with person' do
    get :index, {}, {}, { person_id: Fabricate(:person).id }
    assert_response :success
  end

  test 'should get redirected without person' do
    get :index
    assert_redirected_to root_url
  end
end
