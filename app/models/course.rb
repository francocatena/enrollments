class Course < ActiveRecord::Base
  include Courses::Validations

  has_many :enrollments, dependent: :destroy
  has_many :people, through: :enrollments
end
