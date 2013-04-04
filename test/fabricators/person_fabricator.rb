Fabricator(:person) do
  name           { Faker::Name.first_name }
  lastname       { Faker::Name.last_name }
  identification { sequence(:person_id) }
  email          { |attrs| Faker::Internet.email([attrs[:name], attrs[:identification]].join(' ')) }
end
