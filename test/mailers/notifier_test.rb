require 'test_helper'

class NotifierTest < ActionMailer::TestCase
  test 'should send new enrollment email' do
    enrollment = Fabricate(:enrollment)
    mail = Notifier.new_enrollment(enrollment)

    assert_equal I18n.t('notifier.new_enrollment.subject'), mail.subject
    assert_equal [enrollment.email], mail.to
    assert_equal ['cetem.utn.mendoza@gmail.com'], mail.from
    assert_match 'Hola', mail.body.encoded

    assert_difference 'ActionMailer::Base.deliveries.size' do
      mail.deliver
    end
  end

  test 'should send confirmed email' do
    enrollment = Fabricate(:enrollment)
    mail = Notifier.confirmed(enrollment)

    assert_equal I18n.t('notifier.confirmed.subject'), mail.subject
    assert_equal [enrollment.email], mail.to
    assert_equal ['cetem.utn.mendoza@gmail.com'], mail.from
    assert_match 'Hola', mail.body.encoded

    assert_difference 'ActionMailer::Base.deliveries.size' do
      mail.deliver
    end
  end
end
