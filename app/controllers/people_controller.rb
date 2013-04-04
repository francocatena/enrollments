class PeopleController < ApplicationController
  before_action :set_person, only: [:show, :edit, :update, :destroy]
  before_action :set_courses, only: [:new, :create, :edit, :update]

  # GET /people
  def index
    @people = Person.all
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
      redirect_to @person, notice: t('view.people.correctly_created')
    else
      render action: 'new'
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

  private
    def set_person
      @person = Person.find(params[:id])
    end

    def set_courses
      @courses = Course.unscoped
    end

    def person_params
      params.require(:person).permit(
        :name, :lastname, :email, :identification,
        enrollments_attributes: [:course_id, :comment]
      )
    end
end
