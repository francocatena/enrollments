module People::Validations
  extend ActiveSupport::Concern

  included do
    before_validation :strip_whitespace

    validates :name, :lastname, :email, :identification, presence: true,
      length: { maximum: 255 }
    validates :email, :identification, uniqueness: { case_sensitive: false },
      allow_nil: true, allow_blank: true
    validates :email, uniqueness: { case_sensitive: false },
      format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
  end

  def strip_whitespace
    self.name.try(:strip!)
    self.lastname.try(:strip!)
    self.email.try(:strip!).try(:downcase!)
    self.identification.try(:strip!).try(:downcase!)
  end
end
