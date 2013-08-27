require 'test_helper'

class PeopleControllerTest < ActionController::TestCase
  setup do
    @person = Fabricate(:person)
    @user = Fabricate(:user)
  end

  test 'should get index' do
    sign_in @user

    get :index
    assert_response :success
    assert_not_nil assigns(:people)
  end

  test 'should get new' do
    get :new
    assert_response :success
  end

  test 'should create person' do
    counts = ['Person.count', 'Enrollment.count', 'ActionMailer::Base.deliveries.size']

    assert_difference counts do
      post :create, person: Fabricate.attributes_for(:person_with_enrollments_attributes)
    end

    assert_redirected_to thanks_url(assigns(:person), email: assigns(:person).email)
  end

  test 'should redirect to enrollment' do
    enrollment = Fabricate(:enrollment)

    assert_no_difference 'Person.count' do
      post :create, person: { email: enrollment.email }
    end

    assert_redirected_to registered_url(enrollment, email: enrollment.email)
  end

  test 'should show person' do
    sign_in @user

    get :show, id: @person
    assert_response :success
  end

  test 'should get edit' do
    sign_in @user

    get :edit, id: @person
    assert_response :success
  end

  test 'should update person' do
    sign_in @user

    patch :update, id: @person, person: Fabricate.attributes_for(:person)
    assert_redirected_to person_path(assigns(:person))
  end

  test 'should destroy person' do
    sign_in @user

    assert_difference('Person.count', -1) do
      delete :destroy, id: @person
    end

    assert_redirected_to people_path
  end

  test 'should mark as confirmed' do
    assert !@person.confirmed

    put :confirm, id: @person

    assert_redirected_to people_url
    assert @person.reload.confirmed
  end

  test 'should mark as confirmed via ajax' do
    assert !@person.confirmed

    xhr :put, :confirm, id: @person

    assert_response :success
    assert_template 'people/_person'
    assert @person.reload.confirmed
  end
end
