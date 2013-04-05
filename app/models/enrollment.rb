class Enrollment < ActiveRecord::Base
  include Enrollments::Validations

  delegate :email, to: :person

  default_scope -> { order('created_at ASC') }

  belongs_to :person
  belongs_to :course
end
