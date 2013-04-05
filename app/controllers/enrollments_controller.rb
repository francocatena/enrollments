class EnrollmentsController < ApplicationController
  before_action :set_enrollment, only: [:show]

  # GET /enrollments/1
  def show
    redirect_to root_url unless params[:email] == @enrollment.email
  end

  private

  def set_enrollment
    @enrollment = Enrollment.find(params[:id])
  end
end
