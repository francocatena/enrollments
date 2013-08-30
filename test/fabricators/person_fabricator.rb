Fabricator(:person) do
  name           { Faker::Name.first_name }
  lastname       { Faker::Name.last_name }
  identification { sequence(:person_id) }
  email          { |attrs| Faker::Internet.email([attrs[:name], attrs[:identification]].join(' ')) }
  confirmed      { [true, false].sample }
end

Fabricator(:person_with_enrollments_attributes, from: :person) do
  enrollments_attributes { [Fabricate.attributes_for(:enrollment, person_id: nil)] }
end
