module PeopleHelper
  def person_enrollment
    if action_name == 'new' || action_name == 'create'
      @person.enrollments.detect(&:new_record?) || @person.enrollments.build
    else
      @person.enrollments
    end
  end
end
