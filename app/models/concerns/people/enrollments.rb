module People::Enrollments
  extend ActiveSupport::Concern

  included do
    delegate :last, to: :enrollments, prefix: true

    has_many :enrollments, dependent: :destroy
    accepts_nested_attributes_for :enrollments
  end
end
