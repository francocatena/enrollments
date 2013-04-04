class ThanksController < ApplicationController
  def index
    if session[:person_id]
      @person = Person.find session.delete(:person_id)
    else
      redirect_to root_url
    end
  end
end
