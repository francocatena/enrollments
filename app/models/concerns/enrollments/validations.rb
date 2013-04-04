module Enrollments::Validations
  extend ActiveSupport::Concern

  included do
    validates :course, presence: true
  end
end
