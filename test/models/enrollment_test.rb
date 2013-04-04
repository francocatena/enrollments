require 'test_helper'

class EnrollmentTest < ActiveSupport::TestCase
  setup do
    @enrollment = Fabricate(:enrollment)
  end

  test 'should validate blank attributes' do
    @enrollment.course = nil

    assert @enrollment.invalid?
    assert @enrollment.errors[:course].include?(
      @enrollment.errors.generate_message(:course, :blank)
    )
  end
end
