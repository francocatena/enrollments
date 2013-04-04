module Enrollments::Validations
  extend ActiveSupport::Concern

  included do
    validates :person, :course, presence: true
  end
end
