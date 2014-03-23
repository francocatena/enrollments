class Notifier < ActionMailer::Base
  default from: 'Quiero Ruby <lamanuelsavio@gmail.com>'

  def new_enrollment(enrollment)
    @enrollment = enrollment

    mail to: @enrollment.email
  end

  def confirmed(enrollment)
    @enrollment = enrollment

    mail to: @enrollment.email
  end
end
