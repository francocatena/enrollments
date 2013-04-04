module PeopleHelper
  def new_person_enrollment
    @person.enrollments.detect(&:new_record?) || @person.enrollments.build
  end
end
