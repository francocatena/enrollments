class ThanksController < ApplicationController
  # GET /thanks
  def index
    if flash[:person_id]
      @person = Person.find flash[:person_id]
    else
      redirect_to root_url
    end
  end
end
