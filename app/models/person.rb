class Person < ActiveRecord::Base
  include People::Enrollments
  include People::Validations

  has_many :courses, through: :enrollments
end
