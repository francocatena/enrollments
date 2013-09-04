module People::Enrollments
  extend ActiveSupport::Concern

  included do
    delegate :last, to: :enrollments, prefix: true

    scope :with_notebook, -> {
      includes(:enrollments).where(enrollments: { with_notebook: true })
    }
    scope :without_notebook, -> {
      includes(:enrollments).where(enrollments: { with_notebook: false })
    }

    has_many :enrollments, dependent: :destroy
    accepts_nested_attributes_for :enrollments
  end
end
