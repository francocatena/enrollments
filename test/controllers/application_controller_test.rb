require 'test_helper'

class ApplicationControllerTest < ActionController::TestCase
  def setup
    @controller.send :reset_session
    @controller.send :'response=', @response
    @controller.send :'request=', @request
  end
  
  test 'should require user' do
    @controller.send :require_user
    assert_redirected_to root_url
  end
end
