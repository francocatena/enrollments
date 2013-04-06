class Notifier < ActionMailer::Base
  default from: 'Quiero Ruby <notificaciones@quieroruby.com.ar>'

  def new_enrollment(enrollment)
    @enrollment = enrollment

    mail to: @enrollment.email
  end
end
