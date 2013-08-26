user = User.new(
  email: 'admin@enrollments.com',
  password: '123456',
  password_confirmation: '123456'
)

puts(user.save ? 'User [OK]' : user.errors.full_messages.join("\n"))

course = Course.new(
  name: 'Ruby on Rails',
  active: true
)

puts(course.save ? 'Course [OK]' : course.errors.full_messages.join("\n"))
