user = User.create!(
  email: 'admin@enrollments.com',
  password: '123456',
  password_confirmation: '123456'
)

course = Course.create!(
  name: 'Ruby on Rails',
  active: true
)
