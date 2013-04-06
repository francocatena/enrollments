require 'test_helper'

class ThanksControllerTest < ActionController::TestCase
  setup do
    @person = Fabricate(:person)
  end

  test 'should get thanks with correct person email' do
    get :index, id: @person, email: @person.email
    assert_response :success
    assert_not_nil assigns(:person)
  end

  test 'should get redirected with wrong person email' do
    get :index, id: @person, email: 'wrong@address.com'
    assert_redirected_to root_url
  end
end
