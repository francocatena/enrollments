require 'test_helper'

class EnrollmentTest < ActiveSupport::TestCase
  setup do
    @enrollment = Fabricate(:enrollment)
  end

  test 'should validate blank attributes' do
    @enrollment.person = nil
    @enrollment.course = nil

    assert @enrollment.invalid?
    assert @enrollment.errors[:person].include?(
      @enrollment.errors.generate_message(:person, :blank)
    )
    assert @enrollment.errors[:course].include?(
      @enrollment.errors.generate_message(:course, :blank)
    )
  end
end
