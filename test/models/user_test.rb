require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = Fabricate(:user)
  end
  
  test 'create' do
    assert_difference 'User.count' do
      User.create!(Fabricate.attributes_for(:user))
    end
  end
  
  test 'update' do
    assert_no_difference 'User.count' do
      assert @user.update_attributes(email: 'yoda@enroll.com')
    end
    
    assert_equal 'yoda@enroll.com', @user.reload.email
  end
  
  test 'destroy' do
    assert_difference('User.count', -1) { @user.destroy }
  end
  
  test 'validates blank attributes' do
    @user.email = ''
    
    assert @user.invalid?
    assert_equal 1, @user.errors.size
    assert_equal [error_message_from_model(@user, :email, :blank)],
      @user.errors[:email]
  end
  
  test 'validates well formated attributes' do
    @user.email = 'incorrect@format'
    
    assert @user.invalid?
    assert_equal 1, @user.errors.size
    assert_equal [error_message_from_model(@user, :email, :invalid)],
      @user.errors[:email]
  end
  
  test 'validates unique attributes' do
    new_user = Fabricate(:user)
    @user.email = new_user.email
    
    assert @user.invalid?
    assert_equal 1, @user.errors.size
    assert_equal [error_message_from_model(@user, :email, :taken)],
      @user.errors[:email]
  end
  
  test 'validates confirmated attributes' do
    @user.password = 'admin124'
    @user.password_confirmation = 'admin125'
    assert @user.invalid?
    assert_equal 1, @user.errors.count
    assert_equal [
      error_message_from_model(@user, :password_confirmation, :confirmation)
    ], @user.errors[:password_confirmation]
  end
end
