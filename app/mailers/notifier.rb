class Notifier < ActionMailer::Base
  default from: 'notificaciones@quieroruby.com.ar'

  def new_enrollment(enrollment)
    @enrollment = enrollment

    mail to: @enrollment.email
  end
end
