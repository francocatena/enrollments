class Enrollment < ActiveRecord::Base
  include Enrollments::Validations

  belongs_to :person
  belongs_to :course
end
