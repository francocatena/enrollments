class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  def index
    @title = t 'view.users.index_title'
    @users = User.page(params[:page])

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  # GET /users/1
  def show
    @title = t 'view.users.show_title'

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  # GET /users/new
  def new
    @title = t 'view.users.new_title'
    @user = User.new
  end

  # GET /users/1/edit
  def edit
    @title = t 'view.users.edit_title'
  end

  # POST /users
  def create
    @title = t 'view.users.new_title'
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: t('view.users.correctly_created') }
      else
        format.html { render action: 'new' }
      end
    end
  end

  # PATCH /users/1
  def update
    @title = t 'view.users.edit_title'

    respond_to do |format|
      if @user.update_attributes(user_params)
        format.html { redirect_to @user, notice: t('view.users.correctly_updated') }
      else
        format.html { render action: 'edit' }
      end
    end

  rescue ActiveRecord::StaleObjectError
    flash.alert = t 'view.users.stale_object_error'
    redirect_to edit_user_url(@user)
  end

  # DELETE /users/1
  def destroy
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(
      :email, :password, :password_confirmation, :remember_me, :lock_version
    )
  end
end
