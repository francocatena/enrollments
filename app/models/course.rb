class Course < ActiveRecord::Base
  include Courses::Validations

  scope :active, -> { where(active: true) }

  has_many :enrollments, dependent: :destroy
  has_many :people, through: :enrollments

  def to_s
    name
  end
end
