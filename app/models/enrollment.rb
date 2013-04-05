class Enrollment < ActiveRecord::Base
  include Enrollments::Validations

  delegate :email, to: :person

  belongs_to :person
  belongs_to :course
end
