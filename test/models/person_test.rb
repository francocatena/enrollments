require 'test_helper'

class PersonTest < ActiveSupport::TestCase
  setup do
    @person = Fabricate(:person)
  end

  test 'should validate blank attributes' do
    @person.name = ''
    @person.lastname = ''
    @person.email = ''

    assert @person.invalid?
    assert @person.errors[:name].include?(
      @person.errors.generate_message(:name, :blank)
    )
    assert @person.errors[:lastname].include?(
      @person.errors.generate_message(:lastname, :blank)
    )
    assert @person.errors[:email].include?(
      @person.errors.generate_message(:email, :blank)
    )
  end

  test 'should validate unique attributes' do
    @person.email = Fabricate(:person).email

    assert @person.invalid?
    assert @person.errors[:email].include?(
      @person.errors.generate_message(:email, :taken)
    )
  end

  test 'should validate attributes format' do
    @person.email = 'invalid@email'

    assert @person.invalid?
    assert @person.errors[:email].include?(
      @person.errors.generate_message(:email)
    )
  end
end
