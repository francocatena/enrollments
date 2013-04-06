class EnrollmentsController < ApplicationController
  before_action :set_enrollment, only: [:show]

  # GET /enrollments/1
  def show
    redirect_to root_url unless @enrollment.email == params[:email]
  end

  private

  def set_enrollment
    @enrollment = Enrollment.find(params[:id])
  end
end
