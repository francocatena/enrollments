Fabricator(:person) do
  name     { Faker::Name.first_name }
  lastname { Faker::Name.last_name }
  email    { |attrs| Faker::Internet.email([attrs[:name], sequence(:person_id)].join(' ')) }
end
