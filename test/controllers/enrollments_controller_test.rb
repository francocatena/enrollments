require 'test_helper'

class EnrollmentsControllerTest < ActionController::TestCase
  setup do
    @enrollment = Fabricate(:enrollment)
  end

  test 'should show enrollment' do
    get :show, id: @enrollment, email: @enrollment.email
    assert_response :success
  end

  test 'should redirect to root url for wrong email' do
    get :show, id: @enrollment, email: 'wrong@address.com'
    assert_redirected_to root_url
  end
end
