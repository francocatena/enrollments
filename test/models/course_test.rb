require 'test_helper'

class CourseTest < ActiveSupport::TestCase
  setup do
    @course = Fabricate(:course)
  end

  test 'should validate blank attributes' do
    @course.name = ''

    assert @course.invalid?
    assert @course.errors[:name].include?(
      @course.errors.generate_message(:name, :blank)
    )
  end

  test 'should validate unique attributes' do
    @course.name = Fabricate(:course).name

    assert @course.invalid?
    assert @course.errors[:name].include?(
      @course.errors.generate_message(:name, :taken)
    )
  end

  test 'should validate attributes length' do
    @course.name = 'abcde' * 52

    assert @course.invalid?
    assert @course.errors[:name].include?(
      @course.errors.generate_message(:name, :too_long, count: 255)
    )
  end
end
