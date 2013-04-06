class ThanksController < ApplicationController
  # GET /thanks
  def index
    @person = Person.find(params[:id])

    redirect_to root_url unless @person.email == params[:email]
  end
end
