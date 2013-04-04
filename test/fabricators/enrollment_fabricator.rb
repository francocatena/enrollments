Fabricator(:enrollment) do
  comment   { Faker::Lorem.paragraph }
  person_id { Fabricate(:person).id }
  course_id { Fabricate(:course).id }
end
