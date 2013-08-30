class Notifier < ActionMailer::Base
  default from: 'Quiero Ruby <cetem.utn.mendoza@gmail.com>'

  def new_enrollment(enrollment)
    @enrollment = enrollment

    mail to: @enrollment.email
  end

  def confirmed(enrollment)
    @enrollment = enrollment

    mail to: @enrollment.email
  end
end
