Fabricator(:user) do
  email                 { Faker::Internet.email }
  password              { Faker::Lorem.sentence }
  password_confirmation { |attrs| attrs[:password] }
end
