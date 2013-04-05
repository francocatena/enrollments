require 'test_helper'

class PeopleControllerTest < ActionController::TestCase
  setup do
    @person = Fabricate(:person)
    @request.remote_addr = '127.0.0.1'
  end

  test 'should get index' do
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

    assert_redirected_to thanks_url
  end

  test 'should redirect to enrollment' do
    enrollment = Fabricate(:enrollment)

    assert_no_difference 'Person.count' do
      post :create, person: { email: enrollment.email }
    end

    assert_redirected_to enrollment_url(enrollment, email: enrollment.email)
  end

  test 'should show person' do
    get :show, id: @person
    assert_response :success
  end

  test 'should get edit' do
    get :edit, id: @person
    assert_response :success
  end

  test 'should update person' do
    patch :update, id: @person, person: Fabricate.attributes_for(:person)
    assert_redirected_to person_path(assigns(:person))
  end

  test 'should destroy person' do
    assert_difference('Person.count', -1) do
      delete :destroy, id: @person
    end

    assert_redirected_to people_path
  end
end
