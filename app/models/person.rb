class Person < ActiveRecord::Base
  include People::Validations

  has_many :enrollments, dependent: :destroy
  has_many :courses, through: :enrollments

  accepts_nested_attributes_for :enrollments
end
