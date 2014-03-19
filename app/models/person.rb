class Person < ActiveRecord::Base
  include People::Enrollments
  include People::Validations

  scope :confirmed, -> { where(confirmed: true) }

  has_many :courses, through: :enrollments

  def to_s
    name
  end

  def confirm!
    update! confirmed: true
  end
end
