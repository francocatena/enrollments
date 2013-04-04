require 'test_helper'

class PersonTest < ActiveSupport::TestCase
  setup do
    @person = Fabricate(:person)
  end

  test 'should validate blank attributes' do
    @person.name = ''
    @person.lastname = ''
    @person.email = ''
    @person.identification = ''

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
    assert @person.errors[:identification].include?(
      @person.errors.generate_message(:identification, :blank)
    )
  end

  test 'should validate unique attributes' do
    @person.email = Fabricate(:person).email
    @person.identification = Fabricate(:person).identification

    assert @person.invalid?
    assert @person.errors[:email].include?(
      @person.errors.generate_message(:email, :taken)
    )
    assert @person.errors[:identification].include?(
      @person.errors.generate_message(:identification, :taken)
    )
  end

  test 'should validate attributes format' do
    @person.email = 'invalid@email'

    assert @person.invalid?
    assert @person.errors[:email].include?(
      @person.errors.generate_message(:email)
    )
  end

  test 'should validate attributes length' do
    @person.name = 'abcde' * 52
    @person.lastname = 'abcde' * 52
    @person.email = 'abcde' * 52
    @person.identification = 'abcde' * 52

    assert @person.invalid?
    assert @person.errors[:name].include?(
      @person.errors.generate_message(:name, :too_long, count: 255)
    )
    assert @person.errors[:lastname].include?(
      @person.errors.generate_message(:lastname, :too_long, count: 255)
    )
    assert @person.errors[:email].include?(
      @person.errors.generate_message(:email, :too_long, count: 255)
    )
    assert @person.errors[:identification].include?(
      @person.errors.generate_message(:identification, :too_long, count: 255)
    )
  end
end
