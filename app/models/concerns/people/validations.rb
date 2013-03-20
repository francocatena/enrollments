module People::Validations
  extend ActiveSupport::Concern

  included do
    before_validation :strip_whitespace

    validates :name, :lastname, presence: true
    validates :email, presence: true, uniqueness: { case_sensitive: false },
      format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
  end

  def strip_whitespace
    self.name.try(:strip!)
    self.lastname.try(:strip!)
    self.email.try(:strip!).try(:downcase!)
  end
end
