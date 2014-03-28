class PeopleController < ApplicationController
  before_action :set_person, only:  [:show, :edit, :update, :destroy, :confirm]
  before_action :set_courses, only: [:new, :create, :edit, :update]
  before_action :require_user, except: [:new, :create]

  layout ->(c) { c.request.xhr? ? false : 'application' }

  # GET /people
  def index
    @people = Person.page(params[:page]).order(:id)
    confirmed_people = Person.confirmed

    @with_notebook = confirmed_people.with_notebook.count
    @without_notebook = confirmed_people.without_notebook.count
  end

  # GET /people/1
  def show
  end

  # GET /people/new
  def new
    @person = Person.new
  end

  # GET /people/1/edit
  def edit
  end

  # POST /people
  def create
    @person = Person.new(person_params)

    if @person.save
      Notifier.delay.new_enrollment(@person.enrollments_last)

      redirect_to thanks_url(@person, email: @person.email)
    else
      check_if_already_enrolled
    end
  end

  # PATCH/PUT /people/1
  def update
    if @person.update(person_params)
      redirect_to @person, notice: t('view.people.correctly_updated')
    else
      render action: 'edit'
    end
  rescue ActiveRecord::StaleObjectError
    redirect_to edit_people_url(@user), alert: t('view.people.stale_object_error')
  end

  # DELETE /people/1
  def destroy
    @person.destroy
    redirect_to people_url, notice: t('view.people.correctly_destroyed')
  end

  # PATCH /people/1/confirm
  def confirm
    @person.confirm!

    Notifier.delay.confirmed(@person.enrollments_last)

    if request.xhr?
      redirect_via_turbolinks_to people_url(page: params[:page])
    else
      redirect_to people_url(page: params[:page])
    end
  end

  private

  def set_person
    @person = Person.find(params[:id])
  end

  def set_courses
    @courses = Course.active
  end

  def check_if_already_enrolled
    person = Person.find_by(email: @person.email)

    if person && person.enrollments_last.present?
      redirect_to registered_url(person.enrollments_last, email: person.email)
    else
      render action: 'new'
    end
  end

  def person_params
    params.require(:person).permit(
      :name, :lastname, :email, :identification,
      enrollments_attributes: [:id, :course_id, :comment, :with_notebook]
    )
  end
end
