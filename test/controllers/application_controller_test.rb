require 'test_helper'

class ApplicationControllerTest < ActionController::TestCase
  def setup
    @controller.send :'response=', @response
    @controller.send :'request=', @request
  end
  
  test 'should require local' do
    @request.remote_addr = '127.0.0.1'
    
    assert_nil @controller.send(:require_local)
    
    @request.remote_addr = '192.168.1.1'
    
    assert_not_nil @controller.send(:require_local)
    assert_redirected_to root_url
  end
end
