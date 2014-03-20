require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  setup do
    @user = Fabricate(:user)
  end

  test 'should get index' do
    sign_in @user

    get :index
    assert_response :success
    assert_not_nil assigns(:users)
    assert_select '#unexpected_error', false
    assert_template 'users/index'
  end

  test 'should get new' do
    sign_in @user

    get :new
    assert_response :success
    assert_not_nil assigns(:user)
    assert_select '#unexpected_error', false
    assert_template 'users/new'
  end

  test 'should create user' do
    sign_in @user

    assert_difference('User.count') do
      post :create, user: Fabricate.attributes_for(:user)
    end

    assert_redirected_to user_url(assigns(:user))
  end

  test 'should show user' do
    sign_in @user

    get :show, id: @user
    assert_response :success
    assert_not_nil assigns(:user)
    assert_select '#unexpected_error', false
    assert_template 'users/show'
  end

  test 'should get edit' do
    sign_in @user

    get :edit, id: @user
    assert_response :success
    assert_not_nil assigns(:user)
    assert_select '#unexpected_error', false
    assert_template 'users/edit'
  end

  test 'should update user' do
    sign_in @user

    assert_no_difference 'User.count' do
      patch :update, id: @user,
        user: Fabricate.attributes_for(:user, email: 'yoda@enroll.com')
    end

    assert_redirected_to user_url(assigns(:user))
    assert_equal 'yoda@enroll.com', @user.reload.email
  end

  test 'should destroy user' do
    sign_in @user

    assert_difference('User.count', -1) do
      delete :destroy, id: @user
    end

    assert_redirected_to users_url
  end
end
